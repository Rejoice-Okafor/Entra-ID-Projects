# 02-add-to-groups.ps1
# Add user to security groups based on role
# Connect to Microsoft Graph
Connect-MgGraph -Scopes 'Group.ReadWrite.All'

# Group to add users to (replace with your group ID or display name)
$GroupId = "YOUR-GROUP-ID-HERE"  # You can get this from Azure portal or via Get-MgGroup

# Array of users to add
$Users = @(
    "jdoe@yourtenant.onmicrosoft.com",
    "asmith@yourtenant.onmicrosoft.com",
    "bnguyen@yourtenant.onmicrosoft.com"
)

# Array to store output for display
$Output = @()

foreach ($UPN in $Users) {
    # Get the user object by UPN
    $User = Get-MgUser -UserId $UPN

    # Add the user to the group
    Add-MgGroupMember -GroupId $GroupId -DirectoryObjectId $User.Id

    # Store output
    $Output += [PSCustomObject]@{
        UserPrincipalName = $UPN
        GroupAddedTo     = $GroupId
        Status           = "Added Successfully"
    }
}

# Display results in a table
$Output | Format-Table -AutoSize
