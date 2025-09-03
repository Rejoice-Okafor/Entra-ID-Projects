# 02-assign-licenses.ps1
# Assign Microsoft 365 licenses to a user

Connect-MgGraph -Scopes "User.ReadWrite.All"

$UserId = "jdoe@yourtenant.onmicrosoft.com"
$SkuId = "ENTERPRISEPACK" # Example: Office 365 E3

# Assign license
Set-MgUserLicense -UserId $UserId -AddLicenses @{SkuId=$SkuId}

Write-Host "License assigned to $UserId successfully."

