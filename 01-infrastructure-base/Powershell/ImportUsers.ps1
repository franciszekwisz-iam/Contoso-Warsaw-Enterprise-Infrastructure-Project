<#
.SYNOPSIS
    Bulk imports user accounts from a CSV file into Active Directory.
.DESCRIPTION
    This script reads a list of users from a specified CSV file, converts
    plain-text passwords to SecureString, and creates active accounts in the target OU.
#>

# 1. Configuration variables
$CSVPath = "C:\scripts\employees.csv"
$TargetOU = "OU=Sandbox_HR,OU=SandboxOU,DC=contosowarsaw,DC=com"

# 2. Import data from CSV
$UsersToImport = Import-Csv -Path $CSVPath

# 3. Process each user in the loop
foreach ($User in $UsersToImport) {
    
    # Convert individual plain text password to SecureString
    $SecurePassword = ConvertTo-SecureString -String $User.Password -AsPlainText -Force
    
    # Create the AD User
    New-ADUser -Name $User.Name `
               -SamAccountName $User.SamAccountName `
               -UserPrincipalName $User.UPN `
               -Path $TargetOU `
               -AccountPassword $SecurePassword `
               -Enabled $true `
               -ChangePasswordAtLogon $true
               
    Write-Host "SUCCESS: Imported user '$($User.SamAccountName)' into OU: $TargetOU" -ForegroundColor Green
}