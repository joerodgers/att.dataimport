function Import-DatFile
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true)]
        [string]
        $Path,

        [Parameter(Mandatory=$true)]
        [System.Data.DataTable]
        $DataTable,

        [Parameter(Mandatory=$true)]
        [ScriptBlock]
        $Delegate,

        [Parameter(Mandatory=$false)]
        [int]
        $BatchSize = 10000
    )

    begin
    {
        $counter = 0

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

                if( $null -eq $line -or [string]::IsNullOrWhiteSpace($line) )
                {
                    continue
                }

                $Delegate.Invoke( $DataTable, $Line )

                if( $streamReader.EndOfStream -or $DataTable.Rows.Count -eq $BatchSize )
                {
                    if( $trucateExistingRows )
                    {
                        $trucateExistingRows = $false

                        Write-Verbose "Truncating table: $($DataTable.TableName)"

                        Invoke-NonQuery -Query "TRUNCATE TABLE $($DataTable.TableName)"
                    }

                    Write-Verbose "Bulk copying $($DataTable.Rows.Count) rows in $($DataTable.TableName)"

                    Invoke-BulkInsert -DataTable $DataTable -BatchSize $BatchSize

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