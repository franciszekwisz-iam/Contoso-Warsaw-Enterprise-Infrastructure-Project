<#
.SYNOPSIS
    Generates an active domain users report for Contoso Warsaw.
.DESCRIPTION
    The script queries Active Directory for active user accounts, 
    filters out default system accounts, and exports the results to a CSV file.
.NOTES
    Author: Contoso Administrator
    Version: 1.0
    Date: 21.07.2026
#>

# 1. Define the report output path
$ReportPath = "C:\scripts\AD_Users_Report.csv"

Write-Host "Starting user report generation..." -ForegroundColor Cyan

# 2. Retrieve data, filter out system accounts, and select attributes
$ReportData = Get-ADUser -Filter "Enabled -eq '$true'" -Properties Department | 
    Where-Object { $_.SamAccountName -notIn "Administrator", "krbtgt", "Guest" } | 
    Select-Object Name, SamAccountName, UserPrincipalName, Department, DistinguishedName | 
    Sort-Object Name

# 3. Export data to CSV file (UTF8 ensures proper character encoding)
if ($ReportData) {
    $ReportData | Export-Csv -Path $ReportPath -NoTypeInformation -Encoding UTF8
    Write-Host "SUCCESS: Report saved to: $ReportPath" -ForegroundColor Green
}
else {
    Write-Host "WARNING: No users matching the criteria were found." -ForegroundColor Yellow
}