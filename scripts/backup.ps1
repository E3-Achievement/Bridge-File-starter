param(
  [string]$Root = "$HOME\Notes\BridgeFiles"
)
$ts = Get-Date -Format "yyyyMMdd-HHmmss"
$dest = Join-Path $Root "Backups"
New-Item -ItemType Directory -Force -Path $dest | Out-Null
$zip = Join-Path $dest ("BridgeFiles-" + $ts + ".zip")
if (Test-Path $zip) { Remove-Item $zip -Force }
Compress-Archive -Path (Join-Path (Split-Path $Root) (Split-Path $Root -Leaf)) -DestinationPath $zip -Force
Write-Host "Backup created: $zip"
