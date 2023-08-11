#requires -Version 7

$ErrorActionPreference = 'Stop'

Import-Module -Name "att.dataimport" -MinimumVersion "1.0.0"   -Force -ErrorAction Stop
Import-Module -Name "PSFramework"    -MinimumVersion "1.8.291" -Force -ErrorAction Stop

$timestamp = Get-Date -Format FileDateTime

Start-DataImportLogFileLogger -FilePath "C:\_temp\logs\upgrade-databaseschema_$timestamp.csv"

$dc = New-DataImportDatabaseConnection `
        -DatabaseName          "sql-dataconnect" `
        -DatabaseServer        "srv-dataconnect.database.windows.net" `
        -ClientId              "a5f805f0-6c3c-483e-9bb8-53c65ea299e1" `
        -CertificateThumbprint $env:O365_THUMBPRINT `
        -TenantId              "ef74271e-fef6-44f2-802c-7142413a35c6"

Connect-DataImportService -DatabaseConnection $dc -ErrorAction Stop

Update-DataImportDatabaseSchema -Verbose
                                                  
Stop-DataImportLogFileLogger