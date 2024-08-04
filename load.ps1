function Show-ProgressBarWithSteps {
    param (
        [array]$steps
    )

    $currentSection = ""
    $actualSteps = $steps | Where-Object { $_[0] -ne "section" }
    $totalSteps = $actualSteps.Length
    $stepIndex = 0

    foreach ($step in $steps) {
        if ($step[0] -eq "section") {
            $currentSection = $step[1]
            Write-Host "$currentSection"
            continue
        }

        $stepName = $step[0]
        $stepAction = $step[1]
        $percentComplete = (($stepIndex + 1) / $totalSteps) * 100
        Write-Progress -Activity "Processing: $currentSection" -Status "$stepName" -PercentComplete $percentComplete
        Write-Host "$stepName"
        
        # Execute the action if provided
        if ($stepAction) {
            Invoke-Expression $stepAction
        }

        # Simulate step execution time if no action
        if (-not $stepAction) {
            Start-Sleep -Milliseconds 200
        }

        $stepIndex++
    }

    Write-Host "Config load complete!"
}

# Check home path before defining steps
if(!$env:HOMEPATH){
    Write-Error "Home path not set"
    exit 1
}

# Define the list of steps with names and actions, including sections
$steps = @(
    @("section", "Checking Environment"),
    @("Checking home path", $null),

    @("section", "Updating Environment"),
    @(" - OhMyPosh", ""),
    @(" - PowerShell Profile", ""),

    @("section", "Installing Dependencies"),
    @(" - Glaze-WM", "")
)

# Run the progress bar with the list of steps
Show-ProgressBarWithSteps -steps $steps
