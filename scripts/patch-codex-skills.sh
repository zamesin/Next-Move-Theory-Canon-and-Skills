#!/usr/bin/env bash
# Patch an installed Next Move Theory skills copy for OpenAI Codex.
# The source Skills/ directory and the Claude-installed copy stay unchanged.
set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "usage: $0 <installed-codex-skills-dir>" >&2
  exit 2
fi

DEST="$1"
if [ ! -d "$DEST" ]; then
  echo "ERROR: Codex skills directory not found: $DEST" >&2
  exit 1
fi

python3 - "$DEST" <<'PY'
import pathlib
import re
import sys

dest = pathlib.Path(sys.argv[1])
text_suffixes = {".md", ".markdown", ".txt"}

CHOICE_RULE = (
    " If one logical question lists more than 3 choices, ask that entire "
    "question directly in chat; do not split one logical question across "
    "several `request_user_input` calls. Do not include an explicit Other "
    "option."
)


def convert_codex_text(text: str) -> str:
    text = re.sub(r"\bAskUserQuestion\b", "request_user_input", text)
    text = text.replace("CLAUDE.md", "AGENTS.md")

    text = re.sub(r"(?<![A-Za-z0-9_{}.\-])/ask-nmt(?![A-Za-z0-9_/-])", "$ask-nmt", text)
    text = re.sub(r"(?<![A-Za-z0-9_{}.\-])/diagnose(?![A-Za-z0-9_/-])", "$diagnose", text)
    text = re.sub(r"(?<![A-Za-z0-9_{}.\-])/market-research(?![A-Za-z0-9_/-])", "$market-research", text)
    text = re.sub(r"(?<![A-Za-z0-9_{}.\-])/craft-value-proposition(?![A-Za-z0-9_/-])", "$craft-value-proposition", text)
    text = re.sub(r"(?<![A-Za-z0-9_{}.\-])/product-requirements(?![A-Za-z0-9_/-])", "$product-requirements", text)
    text = re.sub(r"(?<![A-Za-z0-9_{}.\-])/craft-go-to-market(?![A-Za-z0-9_/-])", "$craft-go-to-market", text)
    text = re.sub(r"(?<![A-Za-z0-9_{}.\-])/craft-value-[ \t]*\r?\n[^\r\n]*proposition", "$craft-value-proposition", text)

    text = text.replace("one Claude", "one Codex agent")
    text = text.replace("One Claude", "One Codex agent")
    text = text.replace("Claude's general knowledge", "the active model's general knowledge")

    text = re.sub(r"first `request_user_input`(?! call or direct chat question)", "first `request_user_input` call or direct chat question", text)
    text = re.sub(r"before STAGE 0 / the first `request_user_input`(?! call or direct chat question)", "before STAGE 0 / the first `request_user_input` call or direct chat question", text)
    text = re.sub(r"before the first `request_user_input`(?! call or direct chat question)", "before the first `request_user_input` call or direct chat question", text)
    text = text.replace("English / their language / Other", "English (Recommended) / their language; for another language, ask directly in chat")

    text = text.replace(
        "Collect in a short stream + two batched `request_user_input` calls (max 4 questions each).",
        "Collect in a short stream plus a Codex intake sequence: use `request_user_input` only for structured-choice questions, with at most 3 questions per call and 2-3 choices per question; ask free-text prompts directly in chat. Split the intake into as many calls as needed across separate logical questions, but do not skip required questions." + CHOICE_RULE,
    )

    text = re.sub(
        r'After Steps 1.*?batched via `request_user_input`, each with an explicit \*\*"I don\'t have this info"\*\* option\.',
        'After Steps 1-4, scan the collected input for **gaps that would materially change the research** and ask about *those only*. Use direct chat for free-text gaps. For structured-choice gaps, use `request_user_input` in batches of at most 3 questions, each with 2-3 choices and an explicit **"I don\'t have this info"** option when applicable. Split batches as needed across separate logical questions.' + CHOICE_RULE,
        text,
        flags=re.S,
    )

    text = text.replace(
        "Then one `request_user_input`: **Confirm / Correct (free text)**.",
        "Then confirm with `request_user_input` using **Confirm (Recommended) / Correct**. If the user chooses Correct, ask for the correction directly in chat, update the held input, and re-confirm once.",
    )
    text = text.replace(
        'If the user chooses Correct, ask for the correction directly in chat, update the held input, and re-confirm once. On "Correct", update the held input and re-confirm once.',
        "If the user chooses Correct, ask for the correction directly in chat, update the held input, and re-confirm once.",
    )
    text = text.replace(
        "confirm via one `request_user_input` (Confirm / Correct)",
        "confirm via one `request_user_input` (Confirm (Recommended) / Correct); if Correct, ask for the correction directly in chat",
    )

    text = text.replace(
        "Ask in one batched `request_user_input` (defaults keep the common case friction-free):",
        "Ask as a Codex intake sequence. Use `request_user_input` for structured choices, split into calls of at most 3 questions across separate logical questions, and ask custom paths or other free-text answers directly in chat." + CHOICE_RULE,
    )
    text = text.replace(
        "### One batched `request_user_input`",
        "### Codex intake sequence\n\nUse `request_user_input` for structured choices, split into calls of at most 3 questions across separate logical questions, and ask paths, descriptions, corrections, and multi-select answers directly in chat. Keep every listed intake item; do not skip required information." + CHOICE_RULE,
    )
    text = re.sub(
        r"in \*\*one batch of .*?\*\* `request_user_input`\.?",
        "in one or more Codex intake calls: use `request_user_input` for structured choices with at most 3 questions per call across separate logical questions, and ask free-text details directly in chat." + CHOICE_RULE,
        text,
        flags=re.S,
    )
    text = re.sub(
        r"S2  Business context .*?only the fields not already supplied\)",
        "S2  Business context ----(human: split Codex intake as needed across separate logical questions; only fields not already supplied)",
        text,
        flags=re.S,
    )

    text = text.replace(
        "Present the top 2 via `request_user_input`:",
        "Present the top 2 with `request_user_input` using at most three structured choices; if the user wants neither or wants to reformulate, ask for that reformulation directly in chat:",
    )
    text = re.sub(
        r'- "Neither [^\r\n]*let me reformulate"  [^\r\n]*free-text; re-run S3[^\r\n]*S4 on the new angle',
        'If neither works, ask directly in chat: "What should change?" Then re-run S3-S4 on the new angle.',
        text,
    )

    return text


for path in dest.rglob("*"):
    if not path.is_file() or path.suffix.lower() not in text_suffixes:
        continue
    original = path.read_text(encoding="utf-8")
    updated = convert_codex_text(original)
    if updated != original:
        path.write_text(updated, encoding="utf-8")

contract = dest / "PRODUCER-CONTRACT.md"
if contract.is_file():
    content = contract.read_text(encoding="utf-8")
    if "## Codex interactive intake compatibility" not in content:
        insert = """The six behaviors:

## Codex interactive intake compatibility

This section is a Codex-only override added to the installed `.agents/skills` copy. It does not apply to the source `Skills/` directory or the Claude-installed copy.

- Use `request_user_input` only for structured-choice questions.
- The current Codex tool contract supports 1-3 short questions per call and 2-3 mutually exclusive options per question. Put the recommended option first and mark it `(Recommended)` when there is a default.
- If one logical question lists more than 3 choices, ask that entire question directly in chat. Do not split one logical question across several `request_user_input` calls. Do not include an explicit Other option.
- Ask free-text prompts directly in chat and wait for the reply. This includes product descriptions, paths, URLs, corrections, custom output paths, multi-select answers, and cases where a custom answer is needed.
- Split listed intake batches only across separate logical questions. Do not drop required intake questions just because they no longer fit in one call.
- If `request_user_input` is unavailable in the current Codex mode, ask the same questions directly in chat and wait for the user. Do not silently skip intake.
- The root Codex agent asks interactive questions before spawning subagents. Subagents should not call root-only interactive tools.
- Treat references to Claude tool names such as Read, WebFetch, WebSearch, Write, and Agent as capability requirements, not literal tool names. Use equivalent available Codex tools. If subagents are unavailable, perform the same work sequentially.

"""
        if "The six behaviors:\n\n" in content:
            content = content.replace("The six behaviors:\n\n", insert, 1)
        else:
            content = content.replace("The six behaviors:\r\n\r\n", insert.replace("\n", "\r\n"), 1)
        contract.write_text(content, encoding="utf-8")
PY

echo "Patched Codex skills in: $DEST"
