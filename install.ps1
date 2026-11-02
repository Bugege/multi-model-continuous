<#
.SYNOPSIS
    Install the multi-model-continuous skill into local agent skill directories.

.DESCRIPTION
    Copies SKILL.md from this repository into every agent skill directory that
    already exists on this machine. Existing files are backed up first.

.PARAMETER Target
    dsh | codex | claude | all   (default: all)

.EXAMPLE
    powershell -ExecutionPolicy Bypass -File .\install.ps1 -Target all
#>
[CmdletBinding()]
param(
    [ValidateSet('dsh', 'codex', 'claude', 'all')]
    [string]$Target = 'all'
)

$ErrorActionPreference = 'Stop'

$skillName = 'multi-model-continuous'
$source = Join-Path $PSScriptRoot 'SKILL.md'

if (-not (Test-Path -LiteralPath $source)) {
    throw "SKILL.md not found next to this script: $source"
}

$homeDir = $env:USERPROFILE
$targets = [ordered]@{
    dsh    = (Join-Path $homeDir ".dsh\skills\$skillName")
    codex  = (Join-Path $homeDir ".codex\skills\$skillName")
    claude = (Join-Path $homeDir ".claude\skills\$skillName")
}

$selected = if ($Target -eq 'all') { $targets.Keys } else { @($Target) }
$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$installed = 0

foreach ($name in $selected) {
    $dir = $targets[$name]
    $parent = Split-Path -Parent $dir

    if (-not (Test-Path -LiteralPath $parent)) {
        Write-Host "[skip] $name : parent folder not found -> $parent"
        continue
    }

    if (-not (Test-Path -LiteralPath $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }

    $dest = Join-Path $dir 'SKILL.md'
    if (Test-Path -LiteralPath $dest) {
        $backup = Join-Path $dir ("SKILL.md.bak-" + $stamp)
        Copy-Item -LiteralPath $dest -Destination $backup -Force
        Write-Host "[backup] $name -> $backup"
    }

    Copy-Item -LiteralPath $source -Destination $dest -Force
    $installed++
    Write-Host "[ok] $name -> $dest"
}

Write-Host ""
if ($installed -eq 0) {
    Write-Host "Nothing installed: no matching agent skill folder exists on this machine."
    exit 1
}
Write-Host "Done. Installed to $installed location(s). Restart the agent session if it does not pick the skill up immediately."
