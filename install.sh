#!/usr/bin/env bash
# Next Move Theory — canon + skills installer.
#
# Installs INTO the root of your existing project (the folder you run your agent from):
#   <target>/Next-Move-Theory-Canon/        the canon (keep this exact name)
#   <target>/.claude/skills/<skill>/        skills for Claude Code
#   <target>/.agents/skills/<skill>/        skills for OpenAI Codex
#   <target>/CLAUDE.md, AGENTS.md           rules injected between markers (your file kept)
#   <target>/NextMoveTheory-README.md       this repo's README, renamed
#
# It NEVER leaves a top-level `Skills/` folder and NEVER nests `.claude`/`.agents`/canon
# inside one another. Re-running is idempotent: it replaces the canon, the skills, the
# marked rules block, and the README in place.
#
# Usage:
#   # A) one-liner — fresh install into the CURRENT directory (your project root):
#   curl -fsSL https://raw.githubusercontent.com/zamesin/Next-Move-Theory-Canon-and-Skills/main/install.sh | bash
#
#   # B) from a clone of this repo — installs into the PARENT dir by default
#   #    (so the skills land in your project, not inside the clone). After a
#   #    successful install it REMOVES the clone folder, so
#   #    `git clone … && bash …/install.sh --target .` leaves nothing behind.
#   bash install.sh                 # target = parent of the clone
#   bash install.sh --target DIR    # or an explicit target project root
#   bash install.sh --target .      # or install in place (current dir)
#   bash install.sh --keep-clone    # keep the clone folder after installing
set -euo pipefail

REPO_URL="https://github.com/zamesin/Next-Move-Theory-Canon-and-Skills.git"
CODEX_SKILLS_STAGE=""

cleanup_codex_skills_stage() {
  if [ -n "${CODEX_SKILLS_STAGE:-}" ] && [ -d "$CODEX_SKILLS_STAGE" ]; then
    rm -rf "$CODEX_SKILLS_STAGE"
  fi
}
trap cleanup_codex_skills_stage EXIT

TARGET=""
KEEP_CLONE=0
while [ $# -gt 0 ]; do
  case "$1" in
    --target) TARGET="${2:?--target needs a directory}"; shift 2 ;;
    --keep-clone) KEEP_CLONE=1; shift ;;
    -h|--help) sed -n '2,30p' "$0" 2>/dev/null || true; exit 0 ;;
    *) echo "unknown argument: $1" >&2; exit 1 ;;
  esac
done

# Resolve SRC (where the repo content is) and whether we must clone it.
SELF="${BASH_SOURCE[0]:-}"
CLEANUP_SRC=0
if [ -n "$SELF" ] && [ -f "$SELF" ] && [ -d "$(cd "$(dirname "$SELF")" && pwd)/Skills" ]; then
  # Running from inside a clone of this repo.
  SRC="$(cd "$(dirname "$SELF")" && pwd)"
  # Default target = the clone's PARENT, so skills don't get installed inside the clone.
  [ -z "$TARGET" ] && TARGET="$(dirname "$SRC")"
else
  # Running via `curl | bash` (no repo on disk) — clone to a temp dir.
  command -v git >/dev/null 2>&1 || { echo "git is required" >&2; exit 1; }
  SRC="$(mktemp -d)"
  CLEANUP_SRC=1
  echo "Cloning $REPO_URL ..."
  git clone --depth 1 "$REPO_URL" "$SRC" >/dev/null 2>&1
  # Default target = current directory (your project root).
  [ -z "$TARGET" ] && TARGET="$(pwd)"
fi

# Sanity: SRC must look like this repo.
[ -d "$SRC/Skills" ] && [ -d "$SRC/Next-Move-Theory-Canon" ] || {
  echo "ERROR: source at $SRC does not look like the canon repo (missing Skills/ or Next-Move-Theory-Canon/)." >&2
  exit 1
}
TARGET="$(cd "$TARGET" 2>/dev/null && pwd || { echo "ERROR: target dir not found: $TARGET" >&2; exit 1; })"

# Guard: never install into the clone itself (would create Skills-inside-Skills loops).
if [ "$TARGET" = "$SRC" ]; then
  echo "ERROR: target equals the repo clone ($SRC)." >&2
  echo "Run from your PROJECT ROOT, or pass --target <your-project-root>." >&2
  exit 1
fi

echo "Installing Next Move Theory canon + skills"
echo "  source: $SRC"
echo "  target: $TARGET"

mkdir -p "$TARGET/.claude/skills" "$TARGET/.agents/skills"

# 1. Canon at the root (keep the exact name — skills read it by this relative path).
rm -rf "$TARGET/Next-Move-Theory-Canon"
cp -r "$SRC/Next-Move-Theory-Canon" "$TARGET/Next-Move-Theory-Canon"

# 2. Skills CONTENTS into BOTH agents' skills dirs (the skill folders + the shared
#    contract files), never a standalone top-level Skills/ folder. The Claude copy is
#    unchanged. Patch a temporary Codex staging copy before merging it into
#    .agents/skills, so unrelated existing Codex skills are never read or modified.
cp -r "$SRC"/Skills/. "$TARGET/.claude/skills"/
CODEX_SKILLS_STAGE="$(mktemp -d "${TMPDIR:-/tmp}/nmt-codex-skills.XXXXXX")"
cp -r "$SRC"/Skills/. "$CODEX_SKILLS_STAGE"/
bash "$SRC/scripts/patch-codex-skills.sh" "$CODEX_SKILLS_STAGE"
cp -r "$CODEX_SKILLS_STAGE"/. "$TARGET/.agents/skills"/

# 3. README, renamed (so it doesn't clobber your project's own README).
cp "$SRC/README.md" "$TARGET/NextMoveTheory-README.md"

# 4. Inject the rules between markers into existing CLAUDE.md and AGENTS.md
#    (creates the file if absent; replaces the block in place if markers already exist;
#    never overwrites your own content).
python3 - "$SRC" "$TARGET" <<'PY'
import sys, pathlib
src, target = pathlib.Path(sys.argv[1]), pathlib.Path(sys.argv[2])
S, E = "<!-- Next-Move-Theory-Rules:start -->", "<!-- Next-Move-Theory-Rules:end -->"
for name in ("CLAUDE.md", "AGENTS.md"):
    rules = (src / name)
    if not rules.exists():
        continue
    block = f"{S}\n" + rules.read_text().rstrip() + f"\n{E}\n"
    t = target / name
    cur = t.read_text() if t.exists() else ""
    if S in cur and E in cur:
        pre, rest = cur.split(S, 1)
        _, post = rest.split(E, 1)
        cur = pre + block.rstrip("\n") + post
    else:
        cur = (cur.rstrip() + "\n\n" if cur.strip() else "") + block
    t.write_text(cur)
    print("  injected rules ->", t)
PY

[ "$CLEANUP_SRC" = "1" ] && rm -rf "$SRC"

echo ""
echo "Done — Next Move Theory canon + skills installed. Free and open-source."
echo ""
echo "  Claude Code skills:  $TARGET/.claude/skills/"
echo "  OpenAI Codex skills: $TARGET/.agents/skills/"
echo "  canon:               $TARGET/Next-Move-Theory-Canon/"
echo "  readme:              $TARGET/NextMoveTheory-README.md"
echo ""
echo "Claude Code: run /diagnose or /market-research."
echo 'OpenAI Codex: run /skills or mention $diagnose / $market-research.'
echo ""
echo "Codex setup note: this installer does not edit Codex configuration."
echo "Codex Plan mode (/plan) can ask structured questions by default. Enable this"
echo "experimental feature key manually for full skill intake outside Plan mode:"
echo "  [features]"
echo "  default_mode_request_user_input = true"
echo "Add this to ~/.codex/config.toml, or to .codex/config.toml in a trusted"
echo "project, then restart Codex."
echo 'The key was verified against Codex CLI 0.141.0 with `codex features list`; if it'
echo "is unavailable in your Codex version or mode, the installed Codex skills fall back"
echo "to asking the same questions directly in chat."
echo ""
echo "This is a free, open repository:"
echo "  https://github.com/zamesin/Next-Move-Theory-Canon-and-Skills"
echo ""
echo "The canon is a living document — new theses, chapters, and skills ship over time."
echo "To update, re-run this from your project root. It's safe and idempotent: it refreshes"
echo "the canon, skills, and rules in place and leaves your own files untouched."
echo "  curl -fsSL https://nextmovetheory.com/install.sh | bash"
echo ""
echo "Hear about new releases — subscribe at https://nextmovetheory.com"

# Auto-remove the clone when we installed from one sitting directly inside the
# target (the `git clone … && bash …/install.sh --target .` flow), so the command
# leaves no leftover repo folder. Opt out with --keep-clone. (The curl|bash path
# already cleaned its temp clone above.) cd to the target first so we never delete
# the shell's working directory.
if [ "${CLEANUP_SRC}" = "0" ] && [ "$(dirname "$SRC")" = "$TARGET" ]; then
  if [ "${KEEP_CLONE}" = "1" ]; then
    echo "Clone kept at $SRC (remove it with: rm -rf \"$SRC\")."
  else
    cd "$TARGET" 2>/dev/null || cd /
    rm -rf "$SRC"
    echo "Removed the clone folder: $SRC"
  fi
fi
