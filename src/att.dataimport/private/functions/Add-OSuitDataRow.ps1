function Add-OSuitDataRow
{
    [cmdletbinding()]
    param
    (
        [Parameter(Mandatory=$true)]
        [System.Data.DataTable]
        $DataTable,

        [Parameter(Mandatory=$true)]
        [string]
        $Line
    )

    process
    {
        if( [string]::IsNullOrWhiteSpace($Line) )
        {
            Write-Warning "SKIPPING EMPTY LINE"
            return
        }

        $chunks = $line.Split("|")

        if( $chunks.Count -ne 4 )
        {
            Write-Warning "SKIPPING INVALID ROW DATA: $($line)"
            return
        }

        $datarow = $DataTable.NewRow()

        $null = $dataRow["ATTUID"]         = [string]::IsNullOrWhiteSpace($chunks[0].ToString())  ? $null : $chunks[0].ToString()
        $null = $dataRow["LastName"]       = [string]::IsNullOrWhiteSpace($chunks[1].ToString())  ? $null : $chunks[1].ToString()
        $null = $dataRow["FirstName"]      = [string]::IsNullOrWhiteSpace($chunks[2].ToString())  ? $null : $chunks[2].ToString()
        $null = $dataRow["SeparationDate"] = [string]::IsNullOrWhiteSpace($chunks[3].ToString())  ? $null : [DateTime]::Parse($chunks[3].ToString())
       
        $null = $dataTable.Rows.Add($dataRow)
    }
}