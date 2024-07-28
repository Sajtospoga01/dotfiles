

if(!$env:HOMEPATH){
    Write-Error "Home path not set"
}

Write-Output "Updating environment:"

Write-Output "  - OhMyPosh"
.\ohmyposh\load.ps1

Write-Output "  - PowerShell Profile"
.\powershell\load.ps1

Write-Output "  - Glaze-WM"
.\glazewm\load.ps1

