<#
.SYNOPSIS
    Uniwersalny szablon pętli przetwarzającej dane z pliku CSV.
.DESCRIPTION
    Ten skrypt służy jako wzorzec (boilerplate) dla administratora do masowego 
    przetwarzania obiektów (użytkowników, grup) zaimportowanych z pliku CSV.
.EXAMPLE
    Dostosuj sekcję wewnątrz pętli foreach, aby wykonywać operacje takie jak New-ADUser.
#>

# 1. Wskazanie ścieżki do pliku z danymi
$CSVPath = "C:\Scripts\uzytkownicy.csv"

# 2. Bezpieczny import danych
$Data = Import-Csv -Path $CSVPath

# 3. Pętla przetwarzająca każdy wiersz z osobna
foreach ($Row in $Data) {
    # Tutaj dzieje się magia. $Row reprezentuje jeden wiersz z Twojego pliku.
    # Możesz odwołać się do nagłówków kolumn np.: $Row.Name, $Row.Age
    
    Write-Host "Przetwarzanie obiektu: $($Row.Name)" -ForegroundColor Cyan
}