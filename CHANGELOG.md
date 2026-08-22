# Next Move Theory — Changelog

What changed in the Next Move Theory Canon + Skills Plugin. Newest bundle entry
is at the top.

The primary distribution is the user-global `next-move-theory` suite. Install
and update it through the `skills` CLI flow in the
[`README.md` installation section](README.md#global-plugin-installation). The
repository no longer ships the old shell/PowerShell installers. `nmt-upgrade`
is not the supported global installation or update path; it retains unchanged
Legacy-only behavior for existing project-local setups.

## Versioning

One version covers the whole bundle (canon + skills), tracking **Next Move
Theory** as SemVer `MAJOR.MINOR.PATCH`:

- **MAJOR** — a major version of the Next Move Theory methodology.
- **MINOR** — a significant methodology update (new or reworked theses).
- **PATCH** — small skill updates and methodology patches.

The current bundle version is the top entry below. Existing Legacy project-local
setups may record it in `.nmt-version`; the `skills` CLI manages the installed
suite snapshot in Client user state. (The README also shows the methodology maturity badges — Advanced JTBD
`v3.4 · stable` and Next Move Theory `v0.6 · in active development`.)

---

## 1.0.0 — Self-contained global Plugin bundle
**Summary:** One `next-move-theory` Plugin bundles the Canon and all eight Skills
for user-global Codex and Claude Code installation without Consumer-project
instruction injection.
**Status:** Repository package contract; public marketplace release is separate.

- Added repository-root Codex and Claude manifests and marketplace catalogs.
- Consolidated the package around one hand-maintained `skills/` source tree;
  the `nmt-chat` payload carries the one physical bundled Canon and shared
  references.
- Made `nmt-chat` the model-invoked router and kept Client differences in
  adapter/reference boundaries.
- Documented the exact user-global `npx skills@latest add ...` installation and
  update command, the explicit no-migration boundary, and the unsupported
  partial-install case.
- Added `NOTICE.md` with Ivan Zamesin attribution, the original repository,
  CC BY-NC-SA 4.0 licensing, packaging/path changes, and no endorsement.
- Removed `install.sh` and `install.ps1` from the active release surface; the
  unchanged `nmt-upgrade` Skill remains only for existing Legacy project-local
  setups.

---

## 0.6.17 — Plain-language skills + a clearer first run
**Summary:** Skills now lead in plain words (methodology terms in parentheses), point you to /nmt-chat when you're unsure where to start, ask "quick vs thorough" up front, and keep answers shorter. No methodology change.
**Released:** 2026-06-24

- Plain-first wording across every skill: an everyday explanation leads, the methodology term follows in parentheses — or is used directly for common words like *segment*, *Aha moment*, and *problem*. All glosses were re-verified against the canon.
- Every skill now opens with a "New here? Start here" pointer to `/nmt-chat`, so you always know which skill to run first.
- The producer skills ask how deep to go up front — a few key questions for a fast pass, or the full interview for the highest-confidence result.
- Shorter by default: the one-page answer leads; the deeper work is opt-in, not a wall.
- `nmt-craft-value-proposition` and `nmt-product-requirements` no longer ask you to write a Job in formal notation — describe it in plain words and the skill structures it for you.
- The post-install message now points you straight to `/nmt-chat` and maps every skill.

## 0.6.16 — Faster launch-time update check
**Summary:** The skills' update check now runs inline instead of reading a separate file, so skills start a touch faster. No change to what the check does.
**Released:** 2026-06-22

- Inlined the update check into each skill's body — removed the separate `VERSION-CHECK.md` read on launch; behaviour unchanged (best-effort, ≤2s, never blocks).
- Trimmed the Codex skill descriptions to sit well under the platform's description-length limit.

## 0.6.15 — Auto-update checks + one-command upgrade
**Summary:** Skills now check on launch whether a newer version is available and show what changed since yours. Added the `/nmt-upgrade` one-command updater (Codex: `$nmt-upgrade`).
**Released:** 2026-06-22

- New `nmt-upgrade` skill — re-runs the official installer to pull the latest canon + skills from the public repo, in place and idempotently.
- Every skill now runs a lightweight, best-effort version check on launch (≤2s, silent on failure, never blocks): if your installed version is behind, it tells you the gap and the main changes per version, then how to update.
- The installer now records the installed version in `.nmt-version` so the check can compare it against this changelog.

## 0.6.14 — nmt- prefix, Claude/Codex split, Windows installer
**Summary:** All skills moved to the `nmt-` prefix with separate Claude (`/nmt-…`) and Codex (`$nmt-…`) variants, and a Windows PowerShell installer was added.
**Released:** 2026-06-22

- Skills republished as two agent variants under `Skills/{claude,codex}`: seven `nmt-`prefixed skills (`nmt-chat`, `nmt-diagnose`, `nmt-market-research`, `nmt-craft-value-proposition`, `nmt-product-requirements`, `nmt-craft-go-to-market`, `nmt-analyze-interviews`).
- Claude uses `/nmt-…` and installs to `.claude/skills`; Codex uses `$nmt-…` and installs to `.agents/skills`.
- Added `install.ps1` (Windows PowerShell) and `nmt-chat` zero-state onboarding (paste what you have → next move).

## 0.6.13 — One-command installer + the diagnose skill
**Summary:** Added the one-command `curl … | bash` installer and a new `nmt-diagnose` front-door skill, alongside shared producer and readability contracts.
**Released:** 2026-06-20

- One-command installer (`install.sh`) that clones the repo and installs the canon, skills, and rules block into your project root, idempotently.
- New `nmt-diagnose` skill — a conversational front door for live products that surfaces risks, growth points, and risky assumptions, then routes to the right producer skill.
- Producer + readability contracts shared across the producer skills.
