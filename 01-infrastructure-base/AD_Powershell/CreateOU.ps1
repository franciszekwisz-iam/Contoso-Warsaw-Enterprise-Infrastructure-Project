<#
.SYNOPSIS
    Creates a new Organizational Unit (OU) in Active Directory.
.DESCRIPTION
    This script automates the creation of a target OU and ensures that
    the Active Directory deletion protection flag is enabled by default.
.PARAMETER OUName
    The name of the Organizational Unit to be created.
.PARAMETER ParentPath
    The Distinguished Name (DN) of the parent container.
#>

# 1. Configuration variables
$OUName = "Sandbox_HR"
$ParentPath = "OU=SandboxOU,DC=contosowarsaw,DC=com"

# 2. Execute AD command with accidental deletion protection active
New-ADOrganizationalUnit -Name $OUName -Path $ParentPath -ProtectedFromAccidentalDeletion $true

Write-Host "SUCCESS: Created Organizational Unit '$OUName' under '$ParentPath'" -ForegroundColor Green