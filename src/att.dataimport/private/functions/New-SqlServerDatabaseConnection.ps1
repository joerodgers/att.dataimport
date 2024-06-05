﻿function New-SqlServerDatabaseConnection
{
    [cmdletbinding()]
    param
    (
    )

    begin
    {
    }
    process
    {
        Assert-ServiceConnection -Cmdlet $PSCmdlet

        $connection = $null

        $databaseConnection = Get-CachedObject -Name "DatabaseConnection"

        try 
        {
            $sqlConnectionStringBuilder = New-Object System.Data.SqlClient.SqlConnectionStringBuilder
            $sqlConnectionStringBuilder.PSBase.InitialCatalog           = $databaseConnection.DatabaseName
            $sqlConnectionStringBuilder.PSBase.DataSource               = $databaseConnection.DatabaseServer
            $sqlConnectionStringBuilder.PSBase.IntegratedSecurity       = $true
            $sqlConnectionStringBuilder.PSBase.ConnectTimeout           = $databaseConnection.ConnectTimeout
            $sqlConnectionStringBuilder.PSBase.Encrypt                  = $databaseConnection.Encypt
            $sqlConnectionStringBuilder.PSBase.TrustServerCertificate   = $databaseConnection.Encypt
            $sqlConnectionStringBuilder.PSBase.MultipleActiveResultSets = $false
    
            if( $databaseConnection -is [DataImport.TrustedConnectionDatabaseConnection] )
            {
                $connection = New-Object System.Data.SqlClient.SqlConnection($sqlConnectionStringBuilder.PSBase.ConnectionString)
            }
            else
            {
                $sqlConnectionStringBuilder.PSBase.IntegratedSecurity     = $false
                $sqlConnectionStringBuilder.PSBase.Encrypt                = $true
                $sqlConnectionStringBuilder.PSBase.TrustServerCertificate = $true
                $sqlConnectionStringBuilder.PSBase.PersistSecurityInfo    = $true # allows the AccessToken property to the viewed after the connection is made
    
                $connection = New-Object System.Data.SqlClient.SqlConnection($sqlConnectionStringBuilder.PSBase.ConnectionString)
    
                if( $databaseConnection -is [DataImport.ServicePrincipalCertificateThumbprintDatabaseConnection] )
                {
                    $certificate = Get-ChildItem -Path Cert:\LocalMachine\My\$($databaseConnection.CertificateThumbprint) -ErrorAction Stop
                }
                elseif( $databaseConnection -is [DataImport.ServicePrincipalCertificateDatabaseConnection] )
                {
                    $certificate = $databaseConnection.Certificate
                }

                # generate an access token from Azure AD
                $accessToken = New-AzureSqlAccessToken `
                                    -ClientId    $databaseConnection.ClientId `
                                    -Certificate $certificate `
                                    -TenantId    $databaseConnection.TenantId

                $connection.AccessToken = $accessToken
            }

            Write-PSFMessage -Level Debug -Message "Opening database connection with connection string: $($sqlConnectionStringBuilder.PSBase.ConnectionString)"

            # open the connection
            $connection.Open()
    
            if( -not $connection -or $connection.State -ne "Open" )
            {
                Write-PSFMessage -Level Critical -Message "Failed to open a connection.  Connection string: $($sqlConnectionStringBuilder.PSBase.ConnectionString)"
                throw "Invalid Connection"
            }
    
            return $connection
        }
        catch
        {
            Stop-PSFFunction -Message "Failed to create new database connection." -EnableException $true -ErrorRecord $_
        }
    }
    end
    {
    }
}
