<#
PowerShell helper to deploy the `egkey` keyboard into a qmk_firmware repo and try to compile.
Run from PowerShell (not MSYS):

  powershell -ExecutionPolicy Bypass -File .\deploy_egkey_to_qmk.ps1

The script will look for common qmk_firmware locations and ask before copying.
#>

$ErrorActionPreference = 'Stop'

# Source path where the assistant placed the keyboard files in your workspace
$workspaceEgKey = Join-Path $env:USERPROFILE "Downloads\KicadProjects\ErgoKey\EGKey Main File\Firmware\qmk_firmware\keyboards\custom\egkey"
if (-not (Test-Path $workspaceEgKey)) {
    Write-Host "Cannot find source egkey at:`n  $workspaceEgKey" -ForegroundColor Red
    Write-Host "If your workspace is elsewhere, edit this script and set `$workspaceEgKey` to the path containing the keyboard folder." 
    exit 1
}

# Candidate qmk roots to try
$candidates = @()
$candidates += 'C:\qmk_firmware'
$candidates += (Join-Path $env:USERPROFILE 'qmk_firmware')
$candidates += (Join-Path $env:USERPROFILE 'Downloads\qmk_firmware')
$candidates += (Join-Path $env:USERPROFILE 'Downloads\qmk_firmware-master')
$candidates += (Join-Path $env:USERPROFILE 'Downloads')
$candidates += (Join-Path $PWD 'qmk_firmware')

# Remove duplicates and non-existent parents
$candidates = $candidates | Select-Object -Unique

$found = @()
foreach ($c in $candidates) {
    if (Test-Path $c) { $found += (Get-Item $c).FullName }
}

Write-Host "Candidate QMK roots found:" -ForegroundColor Cyan
$idx = 0
foreach ($f in $found) { Write-Host "[$idx] $f"; $idx++ }
if ($found.Count -eq 0) {
    Write-Host "No common qmk_firmware locations found. Please enter the full path to the qmk_firmware root:" -ForegroundColor Yellow
    $manual = Read-Host "qmk_firmware root path"
    if (-not (Test-Path $manual)) { Write-Host "Path doesn't exist: $manual" -ForegroundColor Red; exit 1 }
    $found += (Get-Item $manual).FullName
}

# Let the user pick one
if ($found.Count -gt 1) {
    $choice = Read-Host "Choose index of the qmk_firmware root to use (default 0)"
    if ($choice -eq '') { $choice = 0 }
    $qmkRoot = $found[$choice]
} else {
    $qmkRoot = $found[0]
}

Write-Host "Using qmk root: $qmkRoot" -ForegroundColor Green

$dest = Join-Path $qmkRoot 'keyboards\custom\egkey'

if (Test-Path $dest) {
    Write-Host "Destination already exists at $dest" -ForegroundColor Yellow
    $ans = Read-Host "Overwrite existing destination? (y/N)"
    if ($ans -notin @('y','Y')) { Write-Host "Aborting."; exit 0 }
    Remove-Item -Recurse -Force $dest
}

# Create parent dir if needed
$parent = Split-Path $dest -Parent
if (-not (Test-Path $parent)) { New-Item -ItemType Directory -Path $parent -Force | Out-Null }

Write-Host "Copying egkey -> $dest ..." -ForegroundColor Cyan
Copy-Item -Path $workspaceEgKey -Destination $dest -Recurse -Force
Write-Host "Copy complete." -ForegroundColor Green

# Run git submodule update in qmk root (if git present)
if (Get-Command git -ErrorAction SilentlyContinue) {
    Write-Host "Running: git submodule update --init --recursive" -ForegroundColor Cyan
    git -C "$qmkRoot" submodule update --init --recursive
} else {
    Write-Host "git not found on PATH, skipping submodule update." -ForegroundColor Yellow
}

# Run qmk setup (if qmk on PATH)
$qmkCmd = Get-Command qmk -ErrorAction SilentlyContinue
if ($qmkCmd) {
    Write-Host "Running: qmk setup" -ForegroundColor Cyan
    & qmk setup
    Write-Host "Refreshing keyboard list..." -ForegroundColor Cyan
    & qmk list-keyboards | Select-String -Pattern 'egkey' -CaseSensitive:$false | ForEach-Object { $_.Line }

    # Try compile
    Write-Host "Attempting to compile default keymap..." -ForegroundColor Cyan
    try {
        & qmk compile -kb custom/egkey -km dm9records_ergoinu_layout_2025-12-07
        Write-Host "Compile finished (check above for success)." -ForegroundColor Green
    } catch {
        Write-Host "Compile returned an error. Capturing output below:" -ForegroundColor Red
        Write-Host $_.Exception.Message
        Write-Host "If the error references unknown pins like PB8/PB9/PB10/PB11, let me know and I will patch `config.h` with conservative pin tokens." -ForegroundColor Yellow
    }
} else {
    Write-Host "qmk CLI (qmk.exe) not found on PATH. Please run this script in an environment where `qmk` is available, or add it to PATH." -ForegroundColor Red
}

Write-Host "Done. If compile failed, please copy the last error output here and I'll prepare a pin patch." -ForegroundColor Cyan

# End of script
