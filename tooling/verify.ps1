[CmdletBinding()]
param(
  [ValidateSet('targeted-db', 'targeted-widget', 'analyze', 'full')]
  [string] $Mode = 'full',

  [switch] $BuildApk,
  [switch] $Codegen,
  [switch] $Format,
  [switch] $SkipProcessWarning
)

$ErrorActionPreference = 'Stop'

function Show-ToolProcesses {
  $processes = Get-Process |
    Where-Object {
      $_.ProcessName -like '*dart*' -or
      $_.ProcessName -like '*flutter*' -or
      $_.ProcessName -like '*gradle*' -or
      $_.ProcessName -like '*java*'
    } |
    Select-Object Id, ProcessName, CPU, StartTime

  if ($processes) {
    Write-Host 'Existing Flutter/Dart/Gradle-related processes detected:' -ForegroundColor Yellow
    $processes | Format-Table -AutoSize
    Write-Host 'If a previous command timed out, stop the stale process before rerunning verification.' -ForegroundColor Yellow
  }
}

function Invoke-Step {
  param(
    [Parameter(Mandatory = $true)]
    [string] $Label,

    [Parameter(Mandatory = $true)]
    [string[]] $Command
  )

  Write-Host ""
  Write-Host "==> $Label" -ForegroundColor Cyan
  Write-Host ($Command -join ' ')

  & $Command[0] @($Command | Select-Object -Skip 1)
  if ($LASTEXITCODE -ne 0) {
    throw "$Label failed with exit code $LASTEXITCODE"
  }
}

if (-not $SkipProcessWarning) {
  Show-ToolProcesses
}

if ($Format) {
  Invoke-Step 'Format source and tests' @('dart', 'format', 'lib', 'test')
}

if ($Codegen) {
  Invoke-Step 'Generate Drift/build_runner outputs' @(
    'dart',
    'run',
    'build_runner',
    'build',
    '--delete-conflicting-outputs'
  )
}

switch ($Mode) {
  'targeted-db' {
    Invoke-Step 'Run targeted database/repository tests' @(
      'flutter',
      'test',
      'test/data/local_database/app_database_test.dart',
      '--reporter',
      'expanded'
    )
  }
  'targeted-widget' {
    Invoke-Step 'Run targeted widget tests' @(
      'flutter',
      'test',
      'test/widget_test.dart',
      '--reporter',
      'expanded'
    )
  }
  'analyze' {
    Invoke-Step 'Analyze Flutter project' @('flutter', 'analyze')
  }
  'full' {
    Invoke-Step 'Analyze Flutter project' @('flutter', 'analyze')
    Invoke-Step 'Run full Flutter test suite' @(
      'flutter',
      'test',
      '--reporter',
      'expanded'
    )
  }
}

if ($BuildApk) {
  Invoke-Step 'Build debug APK' @('flutter', 'build', 'apk', '--debug')
}
