<#
.SYNOPSIS
    Enables a disabled user account in Active Directory.
.DESCRIPTION
    This script enables a specified inactive AD user account,
    restoring their ability to log in.
#>

# 1. Configuration variables
$TargetUser = "jsmith"

# 2. Enable the account
Enable-ADAccount -Identity $TargetUser

Write-Host "SUCCESS: Account '$TargetUser' has been enabled." -ForegroundColor Green