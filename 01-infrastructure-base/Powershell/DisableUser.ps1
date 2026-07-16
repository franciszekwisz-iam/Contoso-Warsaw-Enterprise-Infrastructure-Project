<#
.SYNOPSIS
    Disables an active user account in Active Directory.
.DESCRIPTION
    This script automates the offboarding/suspension process by disabling
    the specified AD user account immediately.
#>

# 1. Configuration variables
$TargetUser = "jsmith"

# 2. Disable the account
Disable-ADAccount -Identity $TargetUser

Write-Host "SUCCESS: Account '$TargetUser' has been disabled." -ForegroundColor Yellow