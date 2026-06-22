param(
    [string]$Target,
    [switch]$KeepClone
)

$ErrorActionPreference = 'Stop'

$Utf8NoBom = New-Object System.Text.UTF8Encoding -ArgumentList $false, $true
$RepoUrl = 'https://github.com/zamesin/Next-Move-Theory-Canon-and-Skills'
$StartLocation = (Get-Location).ProviderPath
$Source = Split-Path -Parent $MyInvocation.MyCommand.Path
$Source = [System.IO.Path]::GetFullPath($Source)

if ([string]::IsNullOrWhiteSpace($Target)) {
    $Target = Split-Path -Parent $Source
}

if (-not (Test-Path -LiteralPath $Target -PathType Container)) {
    throw "target dir not found: $Target"
}

$Target = (Resolve-Path -LiteralPath $Target).ProviderPath
$Target = [System.IO.Path]::GetFullPath($Target)

if (-not (Test-Path -LiteralPath (Join-Path $Source 'Skills') -PathType Container) -or
    -not (Test-Path -LiteralPath (Join-Path $Source 'Next-Move-Theory-Canon') -PathType Container)) {
    throw "source at $Source does not look like the canon repo (missing Skills/ or Next-Move-Theory-Canon/)."
}

if ([string]::Equals($Source.TrimEnd('\'), $Target.TrimEnd('\'), [System.StringComparison]::OrdinalIgnoreCase)) {
    throw "target equals the repo clone ($Source). Run from your PROJECT ROOT, or pass -Target <your-project-root>."
}

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

function Quote-PSString {
    param([Parameter(Mandatory = $true)][string]$Text)
    return "'" + $Text.Replace("'", "''") + "'"
}

function Copy-DirectoryContents {
    param(
        [Parameter(Mandatory = $true)][string]$From,
        [Parameter(Mandatory = $true)][string]$To
    )
    if (-not (Test-Path -LiteralPath $To -PathType Container)) {
        New-Item -ItemType Directory -Path $To | Out-Null
    }
    Copy-Item -Path (Join-Path $From '*') -Destination $To -Recurse -Force
}

function Update-RulesFile {
    param(
        [Parameter(Mandatory = $true)][string]$Name,
        [Parameter(Mandatory = $true)][string]$SourceRoot,
        [Parameter(Mandatory = $true)][string]$TargetRoot
    )

    $sourceFile = Join-Path $SourceRoot $Name
    if (-not (Test-Path -LiteralPath $sourceFile -PathType Leaf)) {
        return
    }

    $start = '<!-- Next-Move-Theory-Rules:start -->'
    $end = '<!-- Next-Move-Theory-Rules:end -->'
    $rules = (Read-Utf8Text -Path $sourceFile).TrimEnd()
    $block = "$start`n$rules`n$end`n"
    $targetFile = Join-Path $TargetRoot $Name

    if (Test-Path -LiteralPath $targetFile -PathType Leaf) {
        $current = Read-Utf8Text -Path $targetFile
    } else {
        $current = ''
    }

    if ($current.Contains($start) -and $current.Contains($end)) {
        $pre, $afterStart = $current.Split(@($start), 2, [System.StringSplitOptions]::None)
        $discard, $post = $afterStart.Split(@($end), 2, [System.StringSplitOptions]::None)
        $updated = $pre + $block.TrimEnd("`n") + $post
    } elseif ($current.Trim().Length -gt 0) {
        $updated = $current.TrimEnd() + "`n`n" + $block
    } else {
        $updated = $block
    }

    Write-Utf8Text -Path $targetFile -Content $updated
    Write-Host "  injected rules -> $targetFile"
}

Write-Host 'Installing Next Move Theory canon + skills'
Write-Host "  source: $Source"
Write-Host "  target: $Target"

$canonTarget = Join-Path $Target 'Next-Move-Theory-Canon'
$claudeSkills = Join-Path $Target '.claude\skills'
$codexSkills = Join-Path $Target '.agents\skills'

if (Test-Path -LiteralPath $canonTarget) {
    Remove-Item -LiteralPath $canonTarget -Recurse -Force
}
Copy-Item -LiteralPath (Join-Path $Source 'Next-Move-Theory-Canon') -Destination $canonTarget -Recurse -Force

New-Item -ItemType Directory -Path $claudeSkills -Force | Out-Null
New-Item -ItemType Directory -Path $codexSkills -Force | Out-Null
Copy-DirectoryContents -From (Join-Path $Source 'Skills') -To $claudeSkills

$patchScript = Join-Path (Join-Path $Source 'scripts') 'patch-codex-skills.ps1'
if (-not (Test-Path -LiteralPath $patchScript -PathType Leaf)) {
    throw "missing Codex patch script: $patchScript"
}

$codexSkillsStage = Join-Path ([System.IO.Path]::GetTempPath()) ("nmt-codex-skills-" + [System.Guid]::NewGuid().ToString('N'))
try {
    New-Item -ItemType Directory -Path $codexSkillsStage -Force | Out-Null
    Copy-DirectoryContents -From (Join-Path $Source 'Skills') -To $codexSkillsStage
    & $patchScript $codexSkillsStage
    Copy-DirectoryContents -From $codexSkillsStage -To $codexSkills
} finally {
    if (Test-Path -LiteralPath $codexSkillsStage) {
        Remove-Item -LiteralPath $codexSkillsStage -Recurse -Force
    }
}

Copy-Item -LiteralPath (Join-Path $Source 'README.md') -Destination (Join-Path $Target 'NextMoveTheory-README.md') -Force

Update-RulesFile -Name 'CLAUDE.md' -SourceRoot $Source -TargetRoot $Target
Update-RulesFile -Name 'AGENTS.md' -SourceRoot $Source -TargetRoot $Target

Write-Host ''
Write-Host 'Done - Next Move Theory canon + skills installed. Free and open-source.'
Write-Host ''
Write-Host "  Claude Code skills:  $claudeSkills"
Write-Host "  OpenAI Codex skills: $codexSkills"
Write-Host "  canon:               $canonTarget"
Write-Host ("  readme:              " + (Join-Path $Target 'NextMoveTheory-README.md'))
Write-Host ''
Write-Host 'Claude Code: run /diagnose or /market-research.'
Write-Host 'OpenAI Codex: run /skills or mention $diagnose / $market-research.'
Write-Host ''
Write-Host 'Codex setup note: this installer does not edit Codex configuration.'
Write-Host 'Codex Plan mode (/plan) can ask structured questions by default. Enable this'
Write-Host 'experimental feature key manually for full skill intake outside Plan mode:'
Write-Host '  [features]'
Write-Host '  default_mode_request_user_input = true'
Write-Host 'Add this to %USERPROFILE%\.codex\config.toml, or to .codex\config.toml in a trusted'
Write-Host 'project, then restart Codex.'
Write-Host 'The key was verified against Codex CLI 0.141.0 with `codex features list`; if it is unavailable in your Codex version or mode, the installed Codex skills fall back to asking the same questions directly in chat.'
Write-Host ''
Write-Host "Repository: $RepoUrl"
Write-Host "To update, re-run the installer from your project root."

$sourceParent = Split-Path -Parent $Source
if ([string]::Equals($sourceParent.TrimEnd('\'), $Target.TrimEnd('\'), [System.StringComparison]::OrdinalIgnoreCase)) {
    if ($KeepClone) {
        Write-Host "Clone kept at $Source (remove it manually when you no longer need it)."
    } else {
        Set-Location -LiteralPath $Target
        try {
            Remove-Item -LiteralPath $Source -Recurse -Force
            Write-Host "Removed the clone folder: $Source"
        } catch {
            $engine = (Get-Process -Id $PID).Path
            if ([string]::IsNullOrWhiteSpace($engine)) {
                $engine = Join-Path $PSHOME 'powershell.exe'
            }
            $quotedSource = Quote-PSString -Text $Source
            $cleanupCommand = "Start-Sleep -Seconds 1; Remove-Item -LiteralPath $quotedSource -Recurse -Force"
            Start-Process -FilePath $engine -ArgumentList @('-NoProfile', '-ExecutionPolicy', 'Bypass', '-Command', $cleanupCommand) -WindowStyle Hidden | Out-Null
            Write-Host "Scheduled clone folder removal after installer exits: $Source"
        }
    }
} else {
    Set-Location -LiteralPath $StartLocation
}
