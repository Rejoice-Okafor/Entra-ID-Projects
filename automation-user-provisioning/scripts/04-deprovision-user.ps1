# Connect to Microsoft Graph
Connect-MgGraph -Scopes 'User.ReadWrite.All','Directory.ReadWrite.All'

# Array of users to deprovision
$Users = @(
    "jdoe@yourtenant.onmicrosoft.com",
    "asmith@yourtenant.onmicrosoft.com",
    "bnguyen@yourtenant.onmicrosoft.com"
)

# Array to store output
$Output = @()

foreach ($UPN in $Users) {
    # Get the user object
    $User = Get-MgUser -UserId $UPN

    # Disable the account
    Set-MgUser -UserId $User.Id -AccountEnabled $false

    # Optional: Remove the user completely
    # Remove-MgUser -UserId $User.Id

    # Store output
    $Output += [PSCustomObject]@{
        UserPrincipalName = $UPN
        Status            = "Disabled Successfully"
    }
}

# Display results in a table
$Output | Format-Table -AutoSize
