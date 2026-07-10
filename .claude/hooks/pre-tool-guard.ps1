$inputData = Get-Content -Raw

if ($inputData -match "terraform destroy|rm -rf") {
    Write-Output "❌ Dangerous command blocked!"
    exit 1
}

exit 0