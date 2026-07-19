<#
.SYNOPSIS
    Generates a structured CSV report of all active non-system domain users.
.DESCRIPTION
    This script queries Active Directory, filters out default system accounts,
    selects specific identity attributes, and exports the sorted data to a CSV report.
#>

# 1. Configuration variables
$ReportPath = "C:\scripts\AD_Users_Report.csv"

# 2. Query AD, filter out disabled/system accounts, and select key properties
$ReportData = Get-ADUser -Filter "Enabled -eq '$true'" | 
    Where-Object { 
        $_.SamAccountName -notIn "Administrator", "krbtgt", "Guest" 
    } | 
    Select-Object Name, SamAccountName, UserPrincipalName, DistinguishedName | 
    Sort-Object Name

# 3. Export the gathered data to a CSV file (NoTypeInformation prevents junk headers)
$ReportData | Export-Csv -Path $ReportPath -NoTypeInformation -Encoding UTF8

Write-Host "SUCCESS: Active users report has been exported to: $ReportPath" -ForegroundColor Green