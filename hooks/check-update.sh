#!/usr/bin/env bash
# Next Move Theory — plugin update nudge (SessionStart). Fail-silent, throttled
# to once/24h, never blocks. Compares the installed plugin commit against
# upstream main and, if behind, nudges via SessionStart additionalContext.
set -uo pipefail

[ -n "${CLAUDE_PLUGIN_ROOT:-}" ] || exit 0

cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}/next-move-theory"
stamp="$cache_dir/last-update-check"
mkdir -p "$cache_dir" 2>/dev/null || exit 0

now=$(date +%s 2>/dev/null) || exit 0
if [ -f "$stamp" ]; then
  last=$(cat "$stamp" 2>/dev/null || echo 0)
  [ $(( now - last )) -lt 86400 ] && exit 0
fi
echo "$now" >"$stamp" 2>/dev/null || true

installed=$(basename "$CLAUDE_PLUGIN_ROOT")
case "$installed" in ""|*[!0-9a-f]*) exit 0 ;; esac

command -v git >/dev/null 2>&1 || exit 0
upstream=$(git ls-remote https://github.com/zamesin/Next-Move-Theory-Canon-and-Skills.git main 2>/dev/null | awk '{print $1}')
[ -n "$upstream" ] || exit 0

n=${#installed}
if [ "${upstream:0:n}" != "$installed" ]; then
  msg="Next Move Theory: a newer version is available upstream (installed ${installed}, latest ${upstream:0:12}). If installed as a Claude Code plugin, set autoUpdate:true for its marketplace in settings, or run claude plugin update <plugin>@<marketplace> then /reload-plugins. install.sh users: run /nmt-upgrade."
  printf '{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"%s"}}\n' "$msg"
fi
exit 0
