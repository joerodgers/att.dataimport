using namespace System.Collections.Generic
using namespace Microsoft.Identity.Web

function New-AzureSqlAccessToken
{
    [cmdletbinding()]
    param
    (
        # Azure AD App Principal Application/Client Id
        [Parameter(Mandatory=$true)]
        [string]
        $ClientId,

        # Azure AD App Principal Application/Client Secret
        [Parameter(Mandatory=$true,ParameterSetName="Certificate")]
        [System.Security.Cryptography.X509Certificates.X509Certificate2]
        $Certificate,

        # Azure AD TenantId
        [Parameter(Mandatory=$true)]
        [string]
        $TenantId
    )

    begin
    {
        $scopes = New-Object System.Collections.Generic.List[string]
        $scopes.Add("https://database.windows.net/.default")
    }
    process
    {
        $confidentialClientApplication = New-ConfidentialClientApplication -ClientId $ClientId -Certificate $Certificate -TenantId $TenantId

        $authenticationResult = $confidentialClientApplication. `
                                            AcquireTokenForClient( $scopes ). `
                                            ExecuteAsync(). `
                                            GetAwaiter(). `
                                            GetResult()

        $authenticationResult.AccessToken
    }
}

