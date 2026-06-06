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
# Why the description is rewritten: the claude.ai web uploader caps the
# frontmatter `description` at 200 characters (the API allows 1024). The
# source SKILL.md descriptions are written long on purpose so Claude Code
# auto-routes accurately, so they're rejected on upload. We swap in a short
# (<=200 char) description per skill below; the skill BODY is left untouched.
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

# claude.ai-safe descriptions, <=200 chars each (enforced below).
declare -A SHORT_DESC=(
  [ask-nmt]="Senior product advisor in Ivan Zamesin's Next Move Theory / Advanced JTBD. Diagnoses strategy, segmentation, value, pricing, growth, positioning and B2B questions, grounded in the canon."
  [market-research]="Market research with Ivan Zamesin's AJTBD / Next Move Theory: size the market, find and score customer segments and Jobs, assess competitors, return a GO/NARROW/PIVOT verdict for an idea."
  [craft-value-proposition]="Build the strongest value proposition for a segment using Ivan Zamesin's AJTBD / Next Move Theory: success criteria, value hypotheses from the mechanics catalog, ranked, plus a PRD-ready spec."
  [product-requirements]="Turn a chosen segment and Core Jobs into a build-ready PRD using Ivan Zamesin's AJTBD / Next Move Theory: challenges the build, maps Jobs to value to success criteria, covers edge cases."
  [craft-go-to-market]="Write go-to-market for a segment using Ivan Zamesin's AJTBD / Next Move Theory: landing-page copy, ad and creative formulas, and a channel plus growth communication plan in the language of Jobs."
)
CLAUDE_AI_DESC_LIMIT=200

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

  # Swap in the claude.ai-safe description (<=200 chars). The source line is
  # a single physical YAML line; we replace it and quote the value so colons
  # in the text don't break the frontmatter.
  short="${SHORT_DESC[$skill]:-}"
  if [ -z "$short" ]; then
    echo "ERROR: no short description defined for '$skill'" >&2
    exit 1
  fi
  if [ "${#short}" -gt "$CLAUDE_AI_DESC_LIMIT" ]; then
    echo "ERROR: short description for '$skill' is ${#short} chars (>$CLAUDE_AI_DESC_LIMIT)" >&2
    exit 1
  fi
  SKILL_SHORT_DESC="$short" python3 - "$stage/SKILL.md" <<'PY'
import os, re, sys
path = sys.argv[1]
desc = os.environ["SKILL_SHORT_DESC"].replace('"', "'")  # keep YAML double-quote safe
with open(path, encoding="utf-8") as f:
    lines = f.readlines()
for i, line in enumerate(lines):
    if line.startswith("description:"):
        lines[i] = f'description: "{desc}"\n'
        break
else:
    sys.exit(f"no description line found in {path}")
with open(path, "w", encoding="utf-8") as f:
    f.writelines(lines)
PY

  # Zip with a single top-level folder == skill name.
  ( cd "$STAGE_DIR" && zip -r -q "$OUT_DIR/$skill.zip" "$skill" )

  size="$(du -h "$OUT_DIR/$skill.zip" | cut -f1)"
  echo "built $skill.zip ($size)"
done

rm -rf "$STAGE_DIR"
echo
echo "Done. Zips are in: $OUT_DIR"
