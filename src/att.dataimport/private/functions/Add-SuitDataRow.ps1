function Add-SuitDataRow
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
        if($null -eq $Line -or [string]::IsNullOrWhiteSpace($Line) )
        {
            Write-Warning "SKIPPING EMPTY LINE"
            return
        }

        $chunks = $line.Split("|")

        if( $null -eq $chunks -or $chunks.Count -ne 39 )
        {
            Write-Warning "SKIPPING INVALID ROW DATA: $($line)"
            return
        }

        $datarow = $DataTable.NewRow()

        $null =  $dataRow["ATTUID"]                   = [string]::IsNullOrWhiteSpace($chunks[0].ToString())  ? $null : $chunks[0].ToString()
        $null =  $dataRow["Status"]                   = [string]::IsNullOrWhiteSpace($chunks[1].ToString())  ? $null : $chunks[1].ToString()
        $null =  $dataRow["FirstName"]                = [string]::IsNullOrWhiteSpace($chunks[2].ToString())  ? $null : $chunks[2].ToString()
        $null =  $dataRow["UnOfficialFirstName"]      = [string]::IsNullOrWhiteSpace($chunks[3].ToString())  ? $null : $chunks[3].ToString()
        $null =  $dataRow["MiddleName"]               = [string]::IsNullOrWhiteSpace($chunks[4].ToString())  ? $null : $chunks[4].ToString()
        $null =  $dataRow["LastName"]                 = [string]::IsNullOrWhiteSpace($chunks[5].ToString())  ? $null : $chunks[5].ToString()
        $null =  $dataRow["EmpStatusCode"]            = [string]::IsNullOrWhiteSpace($chunks[6].ToString())  ? $null : $chunks[6].ToString()
        $null =  $dataRow["WorkStrAddr1"]             = [string]::IsNullOrWhiteSpace($chunks[7].ToString())  ? $null : $chunks[7].ToString()
        $null =  $dataRow["WorkStrAddr2"]             = [string]::IsNullOrWhiteSpace($chunks[8].ToString())  ? $null : $chunks[8].ToString()
        $null =  $dataRow["WorkCity"]                 = [string]::IsNullOrWhiteSpace($chunks[9].ToString())  ? $null : $chunks[9].ToString()
        $null =  $dataRow["WorkState"]                = [string]::IsNullOrWhiteSpace($chunks[10].ToString()) ? $null : $chunks[10].ToString()
        $null =  $dataRow["WorkZip"]                  = [string]::IsNullOrWhiteSpace($chunks[11].ToString()) ? $null : $chunks[11].ToString()
        $null =  $dataRow["WorkZipPlus4"]             = [string]::IsNullOrWhiteSpace($chunks[12].ToString()) ? $null : $chunks[12].ToString()
        $null =  $dataRow["WorkCountry"]              = [string]::IsNullOrWhiteSpace($chunks[13].ToString()) ? $null : $chunks[13].ToString()
        $null =  $dataRow["WorkPhone"]                = [string]::IsNullOrWhiteSpace($chunks[14].ToString()) ? $null : $chunks[14].ToString()
        $null =  $dataRow["WorkPhoneCellular"]        = [string]::IsNullOrWhiteSpace($chunks[15].ToString()) ? $null : $chunks[15].ToString()
        $null =  $dataRow["WorkFax"]                  = [string]::IsNullOrWhiteSpace($chunks[16].ToString()) ? $null : $chunks[16].ToString()
        $null =  $dataRow["WorkEmailId"]              = [string]::IsNullOrWhiteSpace($chunks[17].ToString()) ? $null : $chunks[17].ToString()
        $null =  $dataRow["WorkEmailServer"]          = [string]::IsNullOrWhiteSpace($chunks[18].ToString()) ? $null : $chunks[18].ToString()
        $null =  $dataRow["WorkURL"]                  = [string]::IsNullOrWhiteSpace($chunks[19].ToString()) ? $null : $chunks[19].ToString()
        $null =  $dataRow["SmtpAddress"]              = [string]::IsNullOrWhiteSpace($chunks[20].ToString()) ? $null : $chunks[20].ToString()
        $null =  $dataRow["PagerNumber"]              = [string]::IsNullOrWhiteSpace($chunks[21].ToString()) ? $null : $chunks[21].ToString()
        $null =  $dataRow["PagerPin"]                 = [string]::IsNullOrWhiteSpace($chunks[22].ToString()) ? $null : $chunks[22].ToString()
        $null =  $dataRow["PagerType"]                = [string]::IsNullOrWhiteSpace($chunks[23].ToString()) ? $null : $chunks[23].ToString()
        $null =  $dataRow["CompanyCode"]              = [string]::IsNullOrWhiteSpace($chunks[24].ToString()) ? $null : $chunks[24].ToString()
        $null =  $dataRow["CompanyName"]              = [string]::IsNullOrWhiteSpace($chunks[25].ToString()) ? $null : $chunks[25].ToString()
        $null =  $dataRow["LocationCode"]             = [string]::IsNullOrWhiteSpace($chunks[26].ToString()) ? $null : $chunks[26].ToString()
        $null =  $dataRow["ResponsibilityCode"]       = [string]::IsNullOrWhiteSpace($chunks[27].ToString()) ? $null : $chunks[27].ToString()
        $null =  $dataRow["BuildingCode"]             = [string]::IsNullOrWhiteSpace($chunks[28].ToString()) ? $null : $chunks[28].ToString()
        $null =  $dataRow["RegionCode"]               = [string]::IsNullOrWhiteSpace($chunks[29].ToString()) ? $null : $chunks[29].ToString()
        $null =  $dataRow["JobTitleDescription"]      = [string]::IsNullOrWhiteSpace($chunks[30].ToString()) ? $null : $chunks[30].ToString()
        $null =  $dataRow["UnofficialJobTitleDesc"]   = [string]::IsNullOrWhiteSpace($chunks[31].ToString()) ? $null : $chunks[31].ToString()
        $null =  $dataRow["UnofficialJobTitleSuffix"] = [string]::IsNullOrWhiteSpace($chunks[32].ToString()) ? $null : $chunks[32].ToString()
        $null =  $dataRow["EntityCode"]               = [string]::IsNullOrWhiteSpace($chunks[33].ToString()) ? $null : $chunks[33].ToString()
        $null =  $dataRow["EntityDescription"]        = [string]::IsNullOrWhiteSpace($chunks[34].ToString()) ? $null : $chunks[34].ToString()
        $null =  $dataRow["DominantJobFunctionCode"]  = [string]::IsNullOrWhiteSpace($chunks[35].ToString()) ? $null : $chunks[35].ToString()
        $null =  $dataRow["MgtLevelIndicator"]        = [string]::IsNullOrWhiteSpace($chunks[36].ToString()) ? $null : $chunks[36].ToString()
        $null =  $dataRow["Affiliate"]                = [string]::IsNullOrWhiteSpace($chunks[37].ToString()) ? $null : $chunks[37].ToString()
        $null =  $dataRow["BargainedIndicator"]       = [string]::IsNullOrWhiteSpace($chunks[38].ToString()) ? $null : $chunks[38].ToString()
       
        $null = $dataTable.Rows.Add($dataRow)
    }
}