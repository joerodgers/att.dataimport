function Import-JobChangeDatData
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
        $counter = 0

        $dataTable = New-JobChangeDataTable

        $trucateExistingRows = $true
    }
    process
    {
        if( -not (Test-Path -Path $Path -PathType Leaf ) )
        {
            throw [System.IO.FileNotFoundException]::new( "DAT file not found.", $Path )         
        }

        try
        {
            $streamReader = New-Object System.IO.StreamReader( $Path )

            while( -not $streamReader.EndOfStream )
            {
                if( $counter -eq 0 )
                {
                    $counter++
                    $null = $streamReader.ReadLine()
                    continue
                }                

                $line = $streamReader.ReadLine()

                Add-JobChangeDataRow -DataTable $dataTable -Line $line

                if( $streamReader.EndOfStream -or $dataTable.Rows.Count -eq $BatchSize )
                {
                    if( $trucateExistingRows )
                    {
                        $trucateExistingRows = $false

                        Write-Verbose "Truncating table: attimport.JobChange"

                        Invoke-NonQuery -Query "TRUNCATE TABLE attimport.JobChange"
                    }

                    Write-Verbose "Bulk copying $($BatchSize) rows in attimport.JobChange"

                    Invoke-BulkInsert -DataTable $dataTable -DestinationTableName "attimport.JobChange" -BatchSize $BatchSize

                    $dataTable.Rows.Clear()
                }
            }
        }
        finally
        {

        }

    }
    end
    {
    }
}