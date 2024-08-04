
Write-Output "Backing up:"
Write-Output "  - OhMyPosh Themes"
.\ohmyposh\backup.ps1

Write-Output "  - PowerShell Profile"
.\powershell\backup.ps1

Write-Output "  - Glaze-WM"
.\glazewm\backup.ps1

Write-Output "Installing Setup Tools:"
if (!$env:POSH_THEMES_PATH) {
    winget install OhMyPosh.OhMyPosh
}

if (!$env:Path.Contains("anaconda3") -or !$env:Path.Contains("miniconda3")){
    Write-Output "  - Anaconda 3" 
}else {
    Write-Output "  - anaconda already installed"
}

