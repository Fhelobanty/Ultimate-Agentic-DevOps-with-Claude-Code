$inputData = Get-Content -Raw

if ($inputData -match "delete all|destroy") {
    Write-Output "❌ Destructive prompt blocked!"
    exit 1
}

exit 0