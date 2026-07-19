<#
.SYNOPSIS
    Deploys AGDLP group structure for a specific department.
.DESCRIPTION
    This script automates the creation of both a Global Group (for users) 
    and a Domain Local Group (for resource permissions) in the target OU.
#>

# 1. Configuration variables
$DepartmentName = "IT"
$TargetOU = "OU=Sandbox_HR,OU=SandboxOU,DC=contosowarsaw,DC=com"

# 2. Define AGDLP group names
$GlobalGroupName = "g_Sandbox_$($DepartmentName)_Staff"
$DomainLocalGroupName = "dl_Sandbox_Share_$($DepartmentName)_ReadWrite"

# 3. Create Global Group (Accounts -> Global Group)
New-ADGroup -Name $GlobalGroupName `
            -GroupScope Global `
            -GroupCategory Security `
            -Path $TargetOU

# 4. Create Domain Local Group (Domain Local Group -> Permissions)
New-ADGroup -Name $DomainLocalGroupName `
            -GroupScope DomainLocal `
            -GroupCategory Security `
            -Path $TargetOU

# 5. Nest Global Group inside Domain Local Group (G -> DL)
Add-ADGroupMember -Identity $DomainLocalGroupName -Members $GlobalGroupName

Write-Host "SUCCESS: Deployed AGDLP structure for $DepartmentName in OU: $TargetOU" -ForegroundColor Green
Write-Host "Nested group '$GlobalGroupName' inside '$DomainLocalGroupName'." -ForegroundColor Cyan