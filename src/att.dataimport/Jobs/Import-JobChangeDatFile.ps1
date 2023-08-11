
Import-Module -Name "att.dataimport" -Force -ErrorAction Stop

$dc = New-DataImportDatabaseConnection `
        -DatabaseName   "bulkimport" `
        -DatabaseServer "localhost\sqlexpress"
        
Connect-DataImportService `
        -DatabaseConnection $dc `
        -ErrorAction        Stop

Import-DataImportJobChangeDatData -Path "C:\_projects\att.dataimport\src\att.dataimport\dev\jobchange.txt"