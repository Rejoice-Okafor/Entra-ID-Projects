# 03-add-to-groups.ps1
# Add user to security groups based on role

Connect-MgGraph -Scopes "Group.ReadWrite.All"

$UserId = "jdoe@yourtenant.onmicrosoft.com"
$GroupIds = @("group-id-1", "group-id-2") # Replace with actual group IDs

foreach ($GroupId in $GroupIds) {
    Add-MgGroupMember -GroupId $GroupId -DirectoryObjectId $UserId
    Write-Host "Added $UserId to group $GroupId"
}

