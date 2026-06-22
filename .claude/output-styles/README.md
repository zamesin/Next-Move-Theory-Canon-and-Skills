# Writing-style modes

Switchable writing styles for the agent. They change **only prose density and emphasis** — the Next Move Theory methodology, canon grounding, skill routing, Job grammar, and output-file conventions all stay exactly as defined in `CLAUDE.md` and the skills.

The `canon consistency pass` rewrote the canon toward a clearer, lower-density prose (lead with the point, one idea per sentence, lighter emphasis). Some readers prefer the older, denser format that packs the causal mechanism, compact notation, and calibrated numbers into every paragraph. These modes let each reader pick.

## The three modes

| Mode | What it gives |
|------|---------------|
| `dense` | Maximum signal per paragraph: the causal "why" inline, compact notation/formulas (`margin × satisfaction`), calibrated numbers kept verbatim (`~20%`, `2×`), a dense bold/italic emphasis map, term→definition linked in one breath. Harder to skim, fully loaded. |
| `clear` | The current post-pass format: lead with the point, one idea per sentence, notation unrolled into words, numbers rounded, minimal emphasis, mechanism only on demand. Easy to skim, lighter. |
| `balanced` | Recommended default: the `clear` structure **plus** the second layer back — keeps the mechanism, exact numbers, and notation (in parentheses), with moderate emphasis. |

## How to switch

**Slash command (works everywhere):**

```
/style dense
/style clear
/style balanced
```

`/style` with no argument lists the modes. The chosen style applies to every later response in the session until you switch again. The command lives in `.claude/commands/style.md` and reads the matching file in this directory.

**Native output styles (Claude Code builds that support it):**

```
/output-style dense
```

These same files are valid Claude Code output styles, so on builds that ship the `/output-style` command they appear in its menu and persist across sessions. On builds without it, use the `/style` slash command above.

## Customizing

Each mode is a plain Markdown file with a `name` + `description` frontmatter and a body of writing instructions. Edit a file to tune a mode, or copy one to add your own (e.g. `terse.md`). Rename freely — the `/style` command resolves by filename.
