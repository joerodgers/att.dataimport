function Add-JobChangeDataRow
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

        if( $chunks.Count -ne 9 )
        {
            Write-Warning "SKIPPING INVALID ROW DATA: $($line)"
            return
        }

        $date = $null

        if( (-not [string]::IsNullOrWhiteSpace($chunks[8].ToString())) -and $chunks[8].ToString().Length -eq 8 )
        {
            $year  = $chunks[8].ToString().Substring(0,4)
            $month = $chunks[8].ToString().Substring(4,2)
            $day   = $chunks[8].ToString().Substring(6,2)
            $date = [DateTime]::new( $year, $month, $day )
        }

        $datarow = $DataTable.NewRow()

        $null = $dataRow["ATTUID"]        = [string]::IsNullOrWhiteSpace($chunks[0].ToString())  ? $null : $chunks[0].ToString()
        $null = $dataRow["Lastname"]      = [string]::IsNullOrWhiteSpace($chunks[1].ToString())  ? $null : $chunks[1].ToString()
        $null = $dataRow["Firstname"]     = [string]::IsNullOrWhiteSpace($chunks[2].ToString())  ? $null : $chunks[2].ToString()
        $null = $dataRow["CUID"]          = [string]::IsNullOrWhiteSpace($chunks[3].ToString())  ? $null : $chunks[3].ToString()
        $null = $dataRow["BLSUID"]        = [string]::IsNullOrWhiteSpace($chunks[4].ToString())  ? $null : $chunks[4].ToString()
        $null = $dataRow["BLSCUID"]       = [string]::IsNullOrWhiteSpace($chunks[5].ToString())  ? $null : $chunks[5].ToString()
        $null = $dataRow["HRID"]          = [string]::IsNullOrWhiteSpace($chunks[6].ToString())  ? $null : $chunks[6].ToString()
        $null = $dataRow["MgrATTUID"]     = [string]::IsNullOrWhiteSpace($chunks[7].ToString())  ? $null : $chunks[7].ToString()
        $null = $dataRow["JobChangeDate"] = $date
       
        $null = $dataTable.Rows.Add($dataRow)
    }
}