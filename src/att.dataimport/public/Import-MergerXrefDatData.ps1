function Import-MergerXrefDatData
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
            throw [System.IO.FileNotFoundException]::new( "Merge Xfer DAT file not found.", $Path )         
        }

        $dataTable = New-MergerXrefDataTable

        Import-DatFile -Path $Path -DataTable $dataTable -Delegate ${function:Add-MergerXrefDataRow} -BatchSize $BatchSize
    }
    end
    {
    }
}