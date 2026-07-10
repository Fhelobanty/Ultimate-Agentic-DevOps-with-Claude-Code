#!/bin/bash

LOG_FILE=".claude/deploy.log"

# Read JSON input from Claude
INPUT=$(cat)

# Extract command safely
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // "unknown"')

echo "[$(date)] $COMMAND" >> "$LOG_FILE"

exit 0
$logFile = ".claude/deploy.log"

Add-Content -Path $logFile -Value "[$(Get-Date)] Terraform command executed"

exit 0