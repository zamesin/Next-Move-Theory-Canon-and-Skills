---
description: Switch the writing density style (dense | clear | balanced)
argument-hint: dense | clear | balanced
---

The user wants to switch your writing style to: **$ARGUMENTS**

1. If `$ARGUMENTS` is empty or is not one of `dense`, `clear`, `balanced` — do NOT change anything. Instead list the three available styles with their one-line descriptions (read them from `.claude/output-styles/`) and ask which one.
2. Otherwise, read the file `.claude/output-styles/$ARGUMENTS.md` in this project and ADOPT the writing style it defines.
3. Apply that style **persistently to every subsequent response in this session** until the user runs `/style` again with a different value. It changes only prose density and emphasis — keep all Next Move Theory methodology rules, canon grounding, skill routing, Job grammar, and output-file conventions exactly as defined in CLAUDE.md and the skills.
4. Confirm in ONE short line which style is now active (e.g. `Style → dense (dense canon format)`), then stop. Do not restyle anything retroactively.
