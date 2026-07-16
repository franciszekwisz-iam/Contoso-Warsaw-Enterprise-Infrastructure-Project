<#
.SYNOPSIS
    Creates a new Active Directory user with a secure password.
.DESCRIPTION
    This script automates the creation of an AD user account, sets a temporary 
    password, specifies the target OU, and enables the account immediately.
#>

# 1. Configuration variables
$AccountName = "John Smith"
$SamAccountName = "jsmith"
$UPN = "jsmith@contosowarsaw.com"
$TargetOU = "OU=Sandbox_HR,OU=SandboxOU,DC=contosowarsaw,DC=com"
$TempPasswordText = "P@ssword123!"

# 2. Convert plain text password to SecureString (AD Security Requirement)
$SecurePassword = ConvertTo-SecureString -String $TempPasswordText -AsPlainText -Force

# 3. Create the user in Active Directory
New-ADUser -Name $AccountName `
           -SamAccountName $SamAccountName `
           -UserPrincipalName $UPN `
           -Path $TargetOU `
           -AccountPassword $SecurePassword `
           -Enabled $true `
           -ChangePasswordAtLogon $true

Write-Host "SUCCESS: Created user account '$SamAccountName' in OU: $TargetOU" -ForegroundColor Green