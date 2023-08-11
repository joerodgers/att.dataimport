function Assert-ServiceConnection
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true)]
        [System.Management.Automation.Cmdlet]
        $Cmdlet
    )

    process
    {
        if( -not (Get-CachedObject -Name "DatabaseConnection") )
        {
            $exception   = [System.InvalidOperationException]::new("Database service connection not configured.  Run Connect-DataImportService before running.")
            $errorRecord = [System.Management.Automation.ErrorRecord]::new($exception, "NotConnected", 'InvalidOperation', $null)
            $Cmdlet.ThrowTerminatingError($errorRecord)
        }
    }    
}