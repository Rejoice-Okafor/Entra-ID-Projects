# 04-deprovision-user.ps1
# Disable user account and remove from groups

Connect-MgGraph -Scopes "User.ReadWrite.All","Group.ReadWrite.All"

$UserId = "jdoe@yourtenant.onmicrosoft.com"

# Disable user account
Update-MgUser -UserId $UserId -AccountEnabled:$false
Write-Host "$UserId account disabled."

# Optionally remove licenses
# Set-MgUserLicense -UserId $UserId -RemoveLicenses @("ENTERPRISEPACK")

# Optionally remove from groups
#$GroupIds = @("group-id-1","group-id-2")
#foreach ($GroupId in $GroupIds) {
#    Remove-MgGroupMember -GroupId $GroupId -DirectoryObjectId $UserId
#    Write-Host "Removed $UserId from group $GroupId"
#}

