oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/robbyrussell_custom.omp.json" | Invoke-Expression


function Set-EnvVar {
    $env:POSH=$(echo $env:CONDA_DEFAULT_ENV)
}
New-Alias -Name 'POSH' -Value 'Set-EnvVar' -Scope Global -Force
# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
