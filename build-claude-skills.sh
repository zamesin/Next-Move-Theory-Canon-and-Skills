#!/usr/bin/env bash
#
# build-claude-skills.sh
# Package each Next Move Theory skill into a self-contained .zip ready to
# upload to claude.ai (Settings -> Capabilities -> Skills) or the Claude API.
#
# Why bundling is needed: every SKILL.md reads the methodology canon at
# runtime via relative paths (Next-Move-Theory-Canon/...). In Claude Code the
# canon sits beside the skill in this repo, so it resolves. On claude.ai a
# skill runs in an isolated sandbox and can only see files inside its own zip,
# so we copy the whole canon into each skill package. The canon is small
# (~870 KB), so bundling it into all five is cheap and keeps each zip
# self-contained.
#
# Output: dist/claude-ai/<skill>.zip  (one per skill)
#
# Re-run this after editing any skill or the canon to regenerate the zips.

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$ROOT/Skills"
CANON_DIR="$ROOT/Next-Move-Theory-Canon"
OUT_DIR="$ROOT/dist/claude-ai"
STAGE_DIR="$ROOT/dist/.stage"

if [ ! -d "$CANON_DIR" ]; then
  echo "ERROR: canon not found at $CANON_DIR" >&2
  exit 1
fi

rm -rf "$OUT_DIR" "$STAGE_DIR"
mkdir -p "$OUT_DIR" "$STAGE_DIR"

for skill_path in "$SKILLS_DIR"/*/; do
  skill="$(basename "$skill_path")"
  [ -f "$skill_path/SKILL.md" ] || { echo "skip $skill (no SKILL.md)"; continue; }

  stage="$STAGE_DIR/$skill"
  mkdir -p "$stage"

  # Skill files (SKILL.md, references/, CHANGELOG.md, ...). Follow the
  # symlinks in .claude if any; here we copy from the real Skills/ source.
  cp -RL "$skill_path"/. "$stage"/

  # Bundle the canon at the relative path the SKILL.md expects.
  cp -RL "$CANON_DIR" "$stage/Next-Move-Theory-Canon"

  # Zip with a single top-level folder == skill name.
  ( cd "$STAGE_DIR" && zip -r -q "$OUT_DIR/$skill.zip" "$skill" )

  size="$(du -h "$OUT_DIR/$skill.zip" | cut -f1)"
  echo "built $skill.zip ($size)"
done

rm -rf "$STAGE_DIR"
echo
echo "Done. Zips are in: $OUT_DIR"
