function New-MergerXrefDataTable
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
        # keep in sync with src\att.dataimport\private\sql\table.attimport.MergerXref.sql

        $dataTable = [System.Data.DataTable]::new("attimport.MergerXref")

        $null = $datatable.Columns.Add("Id") 
        $null = $datatable.Columns.Add("ATTUID") 
        $null = $datatable.Columns.Add("ATTHRID")
        $null = $datatable.Columns.Add("CUID")
        $null = $datatable.Columns.Add("BSCUID")
        $null = $datatable.Columns.Add("BSUID")

        return ,$dataTable
    }
    end
    {
    }
}