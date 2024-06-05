$typeDefinition = @'
namespace DataImport
{
    public abstract class DatabaseConnection
    {
        public string DatabaseName {get; set;} 

        public string DatabaseServer {get; set;}

        public int ConnectTimeout {get; set;} = 15;

        public bool Encrypt {get; set;} = true;
    }

    public class ServicePrincipalCertificateThumbprintDatabaseConnection : DatabaseConnection
    {
        public System.Guid ClientId = System.Guid.Empty;

        public System.Guid TenantId = System.Guid.Empty;

        public string CertificateThumbprint = string.Empty;
    }

    public class ServicePrincipalCertificateDatabaseConnection : DatabaseConnection
    {
        public System.Guid ClientId = System.Guid.Empty;

        public System.Guid TenantId = System.Guid.Empty;

        public System.Security.Cryptography.X509Certificates.X509Certificate2 Certificate;
    }

    public class TrustedConnectionDatabaseConnection : DatabaseConnection
    {
    }
}
'@

if (-not ("DataImport.DatabaseConnection" -As [type] ))
{
    Add-Type -TypeDefinition $typeDefinition
}

