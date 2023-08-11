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

    begin
    {
        <#
            #ATTUID|Last|First|CUID|BLSUID|BLSCUID|HRID|MgrATTUID|Job-Change-YYYYMMDD
            aa1234|JOHN DOE|JOHN DOE|aa1234|ABC1234|ABC1234|1234567|bb1234|20230731
            aa2345|JANE DOE|JANE DOE|aa2345|XYZ1234|XYZ1234|0123456|cc1234|20230701
        #>
    }
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

        $null = $dataRow["ATTUID"]        = $chunks[0].ToString()
        $null = $dataRow["Lastname"]      = $chunks[1].ToString()
        $null = $dataRow["Firstname"]     = $chunks[2].ToString()
        $null = $dataRow["CUID"]          = $chunks[3].ToString()
        $null = $dataRow["BLSUID"]        = $chunks[5].ToString()
        $null = $dataRow["BLSCUID"]       = $chunks[5].ToString()
        $null = $dataRow["HRID"]          = $chunks[6].ToString()
        $null = $dataRow["MgrATTUID"]     = $chunks[7].ToString()
        $null = $dataRow["JobChangeDate"] = $date
       
        $null = $dataTable.Rows.Add($dataRow)
    }
    end
    {
    }
}