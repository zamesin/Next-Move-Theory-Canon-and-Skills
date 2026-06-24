---
name: nmt-upgrade
description: >-
  Upgrade an installed Next Move Theory setup to the latest published canon +
  skills by re-running the official one-command installer, which clones the public
  GitHub repo (zamesin/Next-Move-Theory-Canon-and-Skills, branch main) and
  refreshes the canon, the nmt-* skills (both Claude and Codex), the injected
  rules block in CLAUDE.md / AGENTS.md, and the README in place. Idempotent and
  safe: it never touches your own files and never deletes unrelated skills. Use
  when the user says "update NMT", "upgrade the skills", "get the latest canon",
  runs $nmt-upgrade, or when another skill reports that a newer version is
  available. Defaults to English.
user-invocable: true
---

# nmt-upgrade — update to the latest canon + skills

Re-runs the official Next Move Theory installer from the **project root**. The
installer clones the public repo
(`zamesin/Next-Move-Theory-Canon-and-Skills`, branch `main`) and refreshes,
**in place**:

- `Next-Move-Theory-Canon/` — the canon
- `.agents/skills/nmt-*` — Codex skills (invoke with `$nmt-…`)
- `.claude/skills/nmt-*` — Claude skills (invoke with `/nmt-…`)
- the `<!-- Next-Move-Theory-Rules:start … end -->` block in `AGENTS.md` and `CLAUDE.md`
- `NextMoveTheory-README.md`

It is **idempotent and safe** — it replaces the canon, skills, marked rules
block, and README in place, leaves your own files untouched, and does **not**
delete unrelated skills already in `.agents/skills` or `.claude/skills`.

> **Count this run (best-effort, ≤2s, never blocks).** Unlike the other skills, `nmt-upgrade` has no end-of-run version check — that would be circular, since it *is* the updater — so without this it isn't counted in the anonymous launch analytics. As your **first action**, fire a one-off registration ping so the run is counted, then continue with the steps below (on any error or timeout, ignore it):
> `v="$(cat .nmt-version 2>/dev/null)"; curl -fsSL --max-time 2 "https://nextmovetheory.com/version?skill=nmt-upgrade${v:+&v=$v}" >/dev/null 2>&1 || true`

## Steps

1. **Locate the project root** — the folder that contains `Next-Move-Theory-Canon/`
   and/or `.agents/skills/`. That is where the canon + skills must be refreshed.
   If the current directory is not it, ask the user which directory to upgrade.
2. **Run the installer** from that directory:
   ```bash
   curl -fsSL https://nextmovetheory.com/install.sh | bash
   ```
   (Windows / PowerShell: `irm https://nextmovetheory.com/install.ps1 | iex`.)
3. **Report what changed.** Show the installer's final summary. If the project is
   a git repo, run `git status --short` and list which canon files / skill folders
   were added or modified so the user sees exactly what the upgrade pulled in.
4. **Confirm done.** Tell the user the upgrade is complete and that any
   new/updated skills are available immediately (e.g. `$nmt-diagnose`,
   `$nmt-chat`). No restart is needed.

## Notes

- **Best-effort.** The installer needs `curl` and `git`. If either is missing,
  tell the user to install it, or to install manually from
  https://nextmovetheory.com.
- **Non-destructive.** Your own `AGENTS.md` / `CLAUDE.md` content outside the
  marked rules block is preserved; unrelated skills are left alone.
- **Source of truth.** What gets installed is always the current `main` of the
  public repo — the installer clones it fresh on every run, so there is no stale
  cache for the canon or skills.
