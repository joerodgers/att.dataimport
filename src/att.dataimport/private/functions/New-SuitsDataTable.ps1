function New-SuitesDataTable
{
    [cmdletbinding()]
    param
    (
    )

    begin
    {
    }
    process
    {
        $dataTable = [System.Data.DataTable]::new("attimport.Suits")

        $null = $datatable.Columns.Add("Id")
        $null = $datatable.Columns.Add("ATTUID")
        $null = $datatable.Columns.Add("Status")
        $null = $datatable.Columns.Add("FirstName")
        $null = $datatable.Columns.Add("UnOfficialFirstName")
        $null = $datatable.Columns.Add("MiddleName")
        $null = $datatable.Columns.Add("LastName")
        $null = $datatable.Columns.Add("EmpStatusCode")
        $null = $datatable.Columns.Add("WorkStrAddr1")
        $null = $datatable.Columns.Add("WorkStrAddr2")
        $null = $datatable.Columns.Add("WorkCity")
        $null = $datatable.Columns.Add("WorkState")
        $null = $datatable.Columns.Add("WorkZip")
        $null = $datatable.Columns.Add("WorkZipPlus4")
        $null = $datatable.Columns.Add("WorkCountry")
        $null = $datatable.Columns.Add("WorkPhone")
        $null = $datatable.Columns.Add("WorkPhoneCellular")
        $null = $datatable.Columns.Add("WorkFax")
        $null = $datatable.Columns.Add("WorkEmailId")
        $null = $datatable.Columns.Add("WorkEmailServer")
        $null = $datatable.Columns.Add("WorkURL")
        $null = $datatable.Columns.Add("SmtpAddress")
        $null = $datatable.Columns.Add("PagerNumber")
        $null = $datatable.Columns.Add("PagerPin")
        $null = $datatable.Columns.Add("PagerType")
        $null = $datatable.Columns.Add("CompanyCode")
        $null = $datatable.Columns.Add("CompanyName")
        $null = $datatable.Columns.Add("LocationCode")
        $null = $datatable.Columns.Add("ResponsibilityCode")
        $null = $datatable.Columns.Add("BuildingCode")
        $null = $datatable.Columns.Add("RegionCode")
        $null = $datatable.Columns.Add("JobTitleDescription")
        $null = $datatable.Columns.Add("UnofficialJobTitleDesc")
        $null = $datatable.Columns.Add("UnofficialJobTitleSuffix")
        $null = $datatable.Columns.Add("EntityCode")
        $null = $datatable.Columns.Add("EntityDescription")
        $null = $datatable.Columns.Add("DominantJobFunctionCode")
        $null = $datatable.Columns.Add("MgtLevelIndicator")
        $null = $datatable.Columns.Add("Affiliate")
        $null = $datatable.Columns.Add("BargainedIndicator")
            
        return ,$dataTable
    }
    end
    {
    }
}