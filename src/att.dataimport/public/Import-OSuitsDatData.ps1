function Import-OSuitsDatData
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true)]
        [string]
        $Path,

        [Parameter(Mandatory=$false)]
        [int]
        $BatchSize = 10000
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

        $dataTable = New-OSuitesDataTable

        Import-DatFile -Path $Path -DataTable $dataTable -Delegate ${function:Add-OSuitDataRow} -BatchSize $BatchSize
    }
    end
    {
    }
}