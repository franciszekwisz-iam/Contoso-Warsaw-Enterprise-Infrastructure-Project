<#
.SYNOPSIS
    Generuje listę wyłączonych kont użytkowników w Active Directory.
.DESCRIPTION
    Skrypt odpytuje kontroler domeny i zwraca wyłącznie nieaktywne konta,
    sortując je alfabetycznie po nazwie.
#>

Get-ADUser -Filter "Enabled -eq '$false'" | Select-Object Name, SamAccountName, Enabled | Sort-Object Name