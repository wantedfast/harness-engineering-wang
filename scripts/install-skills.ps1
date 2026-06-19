param(
  [string]$Destination = "$env:USERPROFILE\.codex\skills",
  [string]$AgentsDestination = "$env:USERPROFILE\.codex\agents",
  [switch]$Overwrite
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$skillsRoot = Join-Path $repoRoot "skills"

if (-not (Test-Path $skillsRoot)) {
  throw "Cannot find skills directory: $skillsRoot"
}

New-Item -ItemType Directory -Force -Path $Destination | Out-Null

$skillDirs = Get-ChildItem -Path $skillsRoot -Recurse -Filter "SKILL.md" |
  ForEach-Object { $_.Directory.FullName } |
  Sort-Object

foreach ($skillDir in $skillDirs) {
  $skillName = Split-Path -Leaf $skillDir
  $target = Join-Path $Destination $skillName

  if (Test-Path $target) {
    if (-not $Overwrite) {
      Write-Output "Skip existing: $skillName"
      continue
    }
    Remove-Item -Recurse -Force -LiteralPath $target
  }

  Copy-Item -Recurse -LiteralPath $skillDir -Destination $target
  Write-Output "Installed: $skillName"
}

$subagentRoot = Get-ChildItem -Path $skillsRoot -Recurse -Directory -Filter "subagents" |
  Where-Object { Test-Path (Join-Path $_.FullName "qa-expert.toml") } |
  Select-Object -First 1

if ($subagentRoot) {
  New-Item -ItemType Directory -Force -Path $AgentsDestination | Out-Null

  Get-ChildItem -Path $subagentRoot.FullName -Filter "*.toml" | ForEach-Object {
    $target = Join-Path $AgentsDestination $_.Name

    if (Test-Path $target) {
      if (-not $Overwrite) {
        Write-Output "Skip existing agent: $($_.Name)"
        return
      }
      Remove-Item -Force -LiteralPath $target
    }

    Copy-Item -LiteralPath $_.FullName -Destination $target
    Write-Output "Installed agent: $($_.Name)"
  }
}

Write-Output "Done. Restart or refresh Codex to discover installed skills and agents."
