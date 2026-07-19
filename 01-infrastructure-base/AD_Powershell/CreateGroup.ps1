<#
.SYNOPSIS
    Creates a new Security Group in Active Directory.
.DESCRIPTION
    This script automates the creation of a Global Security Group 
    within a specified Organizational Unit.
#>

# 1. Configuration variables
$GroupName = "Sandbox_HR_Staff"
$TargetOU = "OU=Sandbox_HR,OU=SandboxOU,DC=contosowarsaw,DC=com"

# 2. Create the security group
New-ADGroup -Name $GroupName `
            -GroupScope Global `
            -GroupCategory Security `
            -Path $TargetOU

Write-Host "SUCCESS: Created Security Group '$GroupName' in OU: $TargetOU" -ForegroundColor Green