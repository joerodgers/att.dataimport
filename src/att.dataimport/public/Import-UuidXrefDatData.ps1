function Import-UuidXrefDatData
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true)]
        [string]
        $Path
    )

    begin
    {

    }
    process
    {
        if( -not (Test-Path -Path $Path -PathType Leaf ) )
        {
            throw [System.IO.FileNotFoundException]::new( "DAT file not found.", $Path )         
        }

    }
    end
    {
        
    }
}