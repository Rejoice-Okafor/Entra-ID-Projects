# 01-create-user.ps1

# Script to create a new user in Entra ID (Azure AD) via Microsoft Graph API

# You need a User Adminstrator or Global Administator role for this

#Replace username with preferred username

# Connect to Microsoft Graph

Connect-MgGraph -Scopes "User.ReadWrite.All"
# Array of users to create
$Users = @(
    @{UPN="jdoe@yourtenant.onmicrosoft.com"; Name="John Doe"},
    @{UPN="asmith@yourtenant.onmicrosoft.com"; Name="Alice Smith"},
    @{UPN="bnguyen@yourtenant.onmicrosoft.com"; Name="Bob Nguyen"}
)

# Array to store output for display
$Output = @()

foreach ($user in $Users) {
    # Generate a random strong temporary password
    $TempPassword = [System.Web.Security.Membership]::GeneratePassword(12,2) + "1!" 
    # 12 chars, 2 non-alphanumeric, add "1!" to meet complexity requirements

    # Create the user in Entra ID
    New-MgUser -AccountEnabled $true `
               -DisplayName $user.Name `
               -UserPrincipalName $user.UPN `
               -MailNickname ($user.UPN.Split("@")[0]) `
               -PasswordProfile @{ ForceChangePasswordNextSignIn = $true; Password = $TempPassword }

    # Add username and password to output array
    $Output += [PSCustomObject]@{
        UserPrincipalName = $user.UPN
        TemporaryPassword = $TempPassword
    }
}

# Display results in a table format
$Output | Format-Table -AutoSize

