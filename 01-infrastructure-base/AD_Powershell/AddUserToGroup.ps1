<#
.SYNOPSIS
    Adds an Active Directory user to a specified Security Group.
.DESCRIPTION
    This script automates the process of assigning access by adding
    a target user account to a specified AD group.
#>

# 1. Configuration variables
$TargetGroup = "Sandbox_HR_Staff"
$TargetUser = "jsmith"

# 2. Add user to the group
Add-ADGroupMember -Identity $TargetGroup -Members $TargetUser

Write-Host "SUCCESS: Added user '$TargetUser' to group '$TargetGroup'." -ForegroundColor Green