function New-OSuitesDataTable
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
        $dataTable = [System.Data.DataTable]::new("attimport.OSuits")

        $null = $datatable.Columns.Add("Id") 
        $null = $datatable.Columns.Add("ATTUID") 
        $null = $datatable.Columns.Add("LastName")
        $null = $datatable.Columns.Add("FirstName")
        $null = $datatable.Columns.Add("SeparationDate")

        return ,$dataTable
    }
    end
    {
    }
}