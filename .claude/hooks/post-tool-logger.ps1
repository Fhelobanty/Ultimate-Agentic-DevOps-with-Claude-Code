$logFile = ".claude/deploy.log"

Add-Content -Path $logFile -Value "[$(Get-Date)] Terraform command executed"

exit 0