param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$Destination
)

$ErrorActionPreference = 'Stop'

if (-not (Test-Path -LiteralPath $Destination -PathType Container)) {
    throw "Codex skills directory not found: $Destination"
}

$Utf8NoBom = New-Object System.Text.UTF8Encoding -ArgumentList $false, $true
$ChoiceRule = ' If one logical question lists more than 3 choices, ask that entire question directly in chat; do not split one logical question across several `request_user_input` calls. Do not include an explicit Other option.'

function Read-Utf8Text {
    param([Parameter(Mandatory = $true)][string]$Path)
    return [System.IO.File]::ReadAllText($Path, $Utf8NoBom)
}

function Write-Utf8Text {
    param(
        [Parameter(Mandatory = $true)][string]$Path,
        [Parameter(Mandatory = $true)][string]$Content
    )
    [System.IO.File]::WriteAllText($Path, $Content, $Utf8NoBom)
}

function Convert-CodexText {
    param([Parameter(Mandatory = $true)][string]$Text)

    $text = $Text
    $text = $text.Replace('AskUserQuestion', 'request_user_input')
    $text = $text.Replace('CLAUDE.md', 'AGENTS.md')

    $text = [regex]::Replace($text, '(?<![A-Za-z0-9_{}.\-])/ask-nmt(?![A-Za-z0-9_/-])', '$$ask-nmt')
    $text = [regex]::Replace($text, '(?<![A-Za-z0-9_{}.\-])/diagnose(?![A-Za-z0-9_/-])', '$$diagnose')
    $text = [regex]::Replace($text, '(?<![A-Za-z0-9_{}.\-])/market-research(?![A-Za-z0-9_/-])', '$$market-research')
    $text = [regex]::Replace($text, '(?<![A-Za-z0-9_{}.\-])/craft-value-proposition(?![A-Za-z0-9_/-])', '$$craft-value-proposition')
    $text = [regex]::Replace($text, '(?<![A-Za-z0-9_{}.\-])/product-requirements(?![A-Za-z0-9_/-])', '$$product-requirements')
    $text = [regex]::Replace($text, '(?<![A-Za-z0-9_{}.\-])/craft-go-to-market(?![A-Za-z0-9_/-])', '$$craft-go-to-market')
    $text = [regex]::Replace($text, '(?<![A-Za-z0-9_{}.\-])/craft-value-[ \t]*\r?\n[^\r\n]*proposition', '$$craft-value-proposition')

    $text = $text.Replace('one Claude', 'one Codex agent')
    $text = $text.Replace('One Claude', 'One Codex agent')
    $text = $text.Replace("Claude's general knowledge", "the active model's general knowledge")

    $text = [regex]::Replace($text, 'first `request_user_input`(?! call or direct chat question)', 'first `request_user_input` call or direct chat question')
    $text = [regex]::Replace($text, 'before STAGE 0 / the first `request_user_input`(?! call or direct chat question)', 'before STAGE 0 / the first `request_user_input` call or direct chat question')
    $text = [regex]::Replace($text, 'before the first `request_user_input`(?! call or direct chat question)', 'before the first `request_user_input` call or direct chat question')
    $text = $text.Replace('English / their language / Other', 'English (Recommended) / their language; for another language, ask directly in chat')

    $text = $text.Replace(
        'Collect in a short stream + two batched `request_user_input` calls (max 4 questions each).',
        'Collect in a short stream plus a Codex intake sequence: use `request_user_input` only for structured-choice questions, with at most 3 questions per call and 2-3 choices per question; ask free-text prompts directly in chat. Split the intake into as many calls as needed across separate logical questions, but do not skip required questions.' + $ChoiceRule
    )

    $text = [regex]::Replace(
        $text,
        'After Steps 1.*?batched via `request_user_input`, each with an explicit \*\*"I don''t have this info"\*\* option\.',
        'After Steps 1-4, scan the collected input for **gaps that would materially change the research** and ask about *those only*. Use direct chat for free-text gaps. For structured-choice gaps, use `request_user_input` in batches of at most 3 questions, each with 2-3 choices and an explicit **"I don''t have this info"** option when applicable. Split batches as needed across separate logical questions.' + $ChoiceRule,
        [System.Text.RegularExpressions.RegexOptions]::Singleline
    )

    $text = $text.Replace(
        'Then one `request_user_input`: **Confirm / Correct (free text)**.',
        'Then confirm with `request_user_input` using **Confirm (Recommended) / Correct**. If the user chooses Correct, ask for the correction directly in chat, update the held input, and re-confirm once.'
    )
    $text = $text.Replace(
        'If the user chooses Correct, ask for the correction directly in chat, update the held input, and re-confirm once. On "Correct", update the held input and re-confirm once.',
        'If the user chooses Correct, ask for the correction directly in chat, update the held input, and re-confirm once.'
    )
    $text = $text.Replace(
        'confirm via one `request_user_input` (Confirm / Correct)',
        'confirm via one `request_user_input` (Confirm (Recommended) / Correct); if Correct, ask for the correction directly in chat'
    )

    $text = $text.Replace(
        'Ask in one batched `request_user_input` (defaults keep the common case friction-free):',
        'Ask as a Codex intake sequence. Use `request_user_input` for structured choices, split into calls of at most 3 questions across separate logical questions, and ask custom paths or other free-text answers directly in chat.' + $ChoiceRule
    )
    $text = $text.Replace(
        '### One batched `request_user_input`',
        "### Codex intake sequence`n`nUse ``request_user_input`` for structured choices, split into calls of at most 3 questions across separate logical questions, and ask paths, descriptions, corrections, and multi-select answers directly in chat. Keep every listed intake item; do not skip required information." + $ChoiceRule
    )
    $text = [regex]::Replace(
        $text,
        'in \*\*one batch of .*?\*\* `request_user_input`\.?',
        'in one or more Codex intake calls: use `request_user_input` for structured choices with at most 3 questions per call across separate logical questions, and ask free-text details directly in chat.' + $ChoiceRule,
        [System.Text.RegularExpressions.RegexOptions]::Singleline
    )
    $text = [regex]::Replace(
        $text,
        'S2  Business context .*?only the fields not already supplied\)',
        'S2  Business context ----(human: split Codex intake as needed across separate logical questions; only fields not already supplied)',
        [System.Text.RegularExpressions.RegexOptions]::Singleline
    )

    $text = $text.Replace(
        'Present the top 2 via `request_user_input`:',
        'Present the top 2 with `request_user_input` using at most three structured choices; if the user wants neither or wants to reformulate, ask for that reformulation directly in chat:'
    )
    $text = [regex]::Replace(
        $text,
        '- "Neither [^\r\n]*let me reformulate"  [^\r\n]*free-text; re-run S3[^\r\n]*S4 on the new angle',
        'If neither works, ask directly in chat: "What should change?" Then re-run S3-S4 on the new angle.'
    )

    return $text
}

$files = Get-ChildItem -LiteralPath $Destination -Recurse -File |
    Where-Object { $_.Extension -in '.md', '.markdown', '.txt' }

foreach ($file in $files) {
    $content = Read-Utf8Text -Path $file.FullName
    $updated = Convert-CodexText -Text $content
    if ($updated -ne $content) {
        Write-Utf8Text -Path $file.FullName -Content $updated
    }
}

$contract = Join-Path $Destination 'PRODUCER-CONTRACT.md'
if (Test-Path -LiteralPath $contract -PathType Leaf) {
    $content = Read-Utf8Text -Path $contract
    if ($content -notlike '*## Codex interactive intake compatibility*') {
$insert = @'
The six behaviors:

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


'@
        $lfMarker = "The six behaviors:`n`n"
        $crlfMarker = "The six behaviors:`r`n`r`n"
        if ($content.Contains($lfMarker)) {
            $content = $content.Replace($lfMarker, $insert)
        } else {
            $content = $content.Replace($crlfMarker, $insert)
        }
        Write-Utf8Text -Path $contract -Content $content
    }
}

Write-Host "Patched Codex skills in: $Destination"
