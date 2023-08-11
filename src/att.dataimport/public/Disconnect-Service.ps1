function Disconnect-Service
{
    [CmdletBinding()]
    param
    (
    )

    begin
    {
    }
    process
    {
        Clear-CachedObject -Name "DatabaseConnection" -ErrorAction Stop

        Write-PSFMessage -Message "Cached objects cleared successfully" -Level Verbose  
    }
    end
    {
    }
}