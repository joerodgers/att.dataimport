function Add-MergerXrefDataRow
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
        $chunks = $line.Split("|")

        if( $chunks.Count -ne 5 )
        {
            Write-Warning "SKIPPING INVALID ROW DATA: $($line)"
            return
        }

        $datarow = $DataTable.NewRow()

        $null = $dataRow["ATTUID"]  = [string]::IsNullOrWhiteSpace($chunks[0].ToString())  ? $null : $chunks[0].ToString()
        $null = $dataRow["ATTHRID"] = [string]::IsNullOrWhiteSpace($chunks[1].ToString())  ? $null : $chunks[1].ToString()
        $null = $dataRow["CUID"]    = [string]::IsNullOrWhiteSpace($chunks[2].ToString())  ? $null : $chunks[2].ToString()
        $null = $dataRow["BSCUID"]  = [string]::IsNullOrWhiteSpace($chunks[3].ToString())  ? $null : $chunks[3].ToString()
        $null = $dataRow["BSUID"]   = [string]::IsNullOrWhiteSpace($chunks[4].ToString())  ? $null : $chunks[4].ToString()
       
        $null = $dataTable.Rows.Add($dataRow)
    }
}