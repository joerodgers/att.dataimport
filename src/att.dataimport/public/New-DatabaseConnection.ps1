﻿function New-DatabaseConnection
{
    [cmdletbinding(DefaultParameterSetName="TrustedConnection")]
    param
    (
        # Name of the SQL database
        [Parameter(Mandatory=$true,ParameterSetName="TrustedConnection")]
        [Parameter(Mandatory=$true,ParameterSetName="ServicePrincipalThumbprint")]
        [Parameter(Mandatory=$true,ParameterSetName="ServicePrincipalCertificate")]
        [string]
        $DatabaseName,

        # Name of the SQL server or SQL and instance name
        [Parameter(Mandatory=$true,ParameterSetName="TrustedConnection")]
        [Parameter(Mandatory=$true,ParameterSetName="ServicePrincipalThumbprint")]
        [Parameter(Mandatory=$true,ParameterSetName="ServicePrincipalCertificate")]
        [string]
        $DatabaseServer,

        # Connection timeout, default is 15
        [Parameter(Mandatory=$false)]
        [int]
        $ConnectTimeout = 15,

        [Parameter(Mandatory=$false)]
        [switch]
        $Encrypt,

        [Parameter(Mandatory=$true,ParameterSetName="ServicePrincipalThumbprint")]
        [Parameter(Mandatory=$true,ParameterSetName="ServicePrincipalCertificate")]
        [string]
        $ClientId,

        [Parameter(Mandatory=$true,ParameterSetName="ServicePrincipalThumbprint")]
        [string]
        $CertificateThumbprint,

        [Parameter(Mandatory=$true,ParameterSetName="ServicePrincipalCertificate")]
        [System.Security.Cryptography.X509Certificates.X509Certificate2]
        $Certificate,

        [Parameter(Mandatory=$true,ParameterSetName="ServicePrincipalThumbprint")]
        [Parameter(Mandatory=$true,ParameterSetName="ServicePrincipalCertificate")]
        [Guid]
        $TenantId
    )

    begin
    {
    }
    process
    {
        if( $PSCmdlet.ParameterSetName -eq "TrustedConnection" )
        {
            return New-Object DataImport.TrustedConnectionDatabaseConnection -Property @{ 
                DatabaseName   = $DatabaseName
                DatabaseServer = $DatabaseServer
                ConnectTimeout = $ConnectTimeout
                Encrypt        = $Encrypt.IsPresent
            }
        }
        
        if( $PSCmdlet.ParameterSetName -eq "ServicePrincipalThumbprint" )
        {
            return New-Object DataImport.ServicePrincipalCertificateThumbprintDatabaseConnection -Property @{
                DatabaseName          = $DatabaseName
                DatabaseServer        = $DatabaseServer
                ConnectTimeout        = $ConnectTimeout
                Encrypt               = $true
                ClientId              = $ClientId
                CertificateThumbprint = $CertificateThumbprint
                TenantId              = $TenantId
            }
        }

        if( $PSCmdlet.ParameterSetName -eq "ServicePrincipalCertificate" )
        {
            return New-Object DataImport.ServicePrincipalCertificateDatabaseConnection -Property @{
                DatabaseName    = $DatabaseName
                DatabaseServer  = $DatabaseServer
                ConnectTimeout  = $ConnectTimeout
                Encrypt         = $true
                ClientId        = $ClientId
                Certificate     = $Certificate
                TenantId        = $TenantId
            }
        }

        return $null
    }
    end
    {
    }
}

