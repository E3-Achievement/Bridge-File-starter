param(
  [string]$Root = "$HOME\Notes\BridgeFiles"
)
New-Item -ItemType Directory -Force -Path "$Root" | Out-Null
New-Item -ItemType Directory -Force -Path "$Root\Screenshots","$Root\Scrolls","$Root\SessionNotes","$Root\Backups" | Out-Null

if (!(Test-Path "$Root\README.md")) { Copy-Item "$PSScriptRoot\..\README-BridgeFileSystem.md" "$Root\README.md" -Force }
if (!(Test-Path "$Root\.gitignore")) { Copy-Item "$PSScriptRoot\..\.gitignore" "$Root\.gitignore" -Force }
if (!(Test-Path "$Root\.gitattributes")) { Copy-Item "$PSScriptRoot\..\.gitattributes" "$Root\.gitattributes" -Force }
$notesFile = (Get-Date -Format "yyyy-MM-dd") + "-Notes.md"
if (!(Test-Path "$Root\SessionNotes\$notesFile")) { "# $(Get-Date -Format yyyy-MM-dd) Notes`n" | Out-File -Encoding UTF8 "$Root\SessionNotes\$notesFile" }
$sessionFile = "RecursiveRosettaStone-Session-" + (Get-Date -Format "yyyyMMdd") + ".md"
if (!(Test-Path "$Root\$sessionFile")) { Copy-Item "$PSScriptRoot\..\templates\Bridgefile-Session-Template.md" "$Root\$sessionFile" -Force }

# Optional Git + LFS
if (Get-Command git -ErrorAction SilentlyContinue) {
  Set-Location $Root
  if (!(Test-Path ".git")) {
    git init | Out-Null
    try { git lfs install | Out-Null } catch {}
    git add .
    git commit -m "BridgeFiles: initialized" | Out-Null
  }
}
Write-Host "BridgeFiles initialized at: $Root"
