param([string]$Root = "$HOME\Notes\BridgeFiles")
python "$(Join-Path $PSScriptRoot 'hashdir.py')" $Root
