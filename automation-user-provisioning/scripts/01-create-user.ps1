# 01-create-user.ps1
# Script to create a new user in Entra ID (Azure AD) via Microsoft Graph API

# Connect to Microsoft Graph
Connect-MgGraph -Scopes "User.ReadWrite.All"

# Variables - Replace with your own user details
$UserPrincipalName = "MaryJane@yourtenant.onmicrosoft.com"
$DisplayName = "Mary Jane"
$Password = "P@ssword123!" # Temporary password
$Department = "IT"

# Create user
New-MgUser -AccountEnabled $true `
           -DisplayName $DisplayName `
           -UserPrincipalName $UserPrincipalName `
           -MailNickname "jdoe" `
           -PasswordProfile @{ ForceChangePasswordNextSignIn = $true; Password = $Password } `
           -Department $Department

Write-Host "User $DisplayName created successfully."

