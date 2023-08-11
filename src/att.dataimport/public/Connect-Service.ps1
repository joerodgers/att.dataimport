function Connect-Service
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true)]
        [DataImport.DatabaseConnection]
        $DatabaseConnection
    )
   
    Set-CachedObject -Name "DatabaseConnection" -Object $DatabaseConnection -ErrorAction Stop


    Write-PSFMessage -Message "Connected to data import service" -Level Verbose  
}