<#
Commit and push `egkey` keyboard files to your repo's origin remote.

Usage (PowerShell):
  cd C:\qmk_firmware
  powershell -ExecutionPolicy Bypass -File .\scripts\commit_and_push_egkey.ps1 -Message "Add egkey keyboard files"

Notes:
- This script will `git add` the `keyboards/egkey` and `keyboards/custom/egkey` folders, commit, and push to the current branch's remote.
- It will not create remotes or authenticate for you; ensure your git is configured with credentials (credential manager, SSH key, or PAT).
- If you prefer a different branch name, pass `-Branch 'my-branch'`.
#>
param(
    [string]$Message = "Add egkey keyboard files",
    [string]$Branch = "$(git rev-parse --abbrev-ref HEAD 2>$null)"
)

$ErrorActionPreference = 'Stop'

if (-not (Test-Path "./.git")) {
    Write-Host "ERROR: This directory does not look like a git repo. Run this from the qmk_firmware root." -ForegroundColor Red
    exit 1
}

Write-Host "Staging egkey files..." -ForegroundColor Cyan
git add keyboards/egkey || git add keyboards/egkey -A
git add keyboards/custom/egkey || true

Write-Host "Creating commit (branch: $Branch)..." -ForegroundColor Cyan
# If the branch variable is empty, get current branch
if (-not $Branch) {
    $Branch = git rev-parse --abbrev-ref HEAD
}

# Create branch if it doesn't exist locally
$localBranches = git branch --format='%(refname:short)'
if (-not ($localBranches -contains $Branch)) {
    Write-Host "Creating new local branch: $Branch" -ForegroundColor Yellow
    git checkout -b $Branch
}

# Commit
try {
    git commit -m "$Message"
} catch {
    Write-Host "No changes to commit or commit failed: $_" -ForegroundColor Yellow
}

# Push
try {
    Write-Host "Pushing to origin/$Branch..." -ForegroundColor Cyan
    git push -u origin $Branch
    Write-Host "Push succeeded." -ForegroundColor Green
} catch {
    Write-Host "Push failed. You may need to setup credentials or push manually. Error:" -ForegroundColor Red
    Write-Host $_.Exception.Message
}

Write-Host "Done. If push failed, run the following commands manually and paste output here:" -ForegroundColor Cyan
Write-Host "  git status" -ForegroundColor Gray
Write-Host "  git remote -v" -ForegroundColor Gray
Write-Host "  git push origin $Branch" -ForegroundColor Gray
