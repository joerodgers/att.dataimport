function New-JobChangeDataTable
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
        $dataTable = New-Object System.Data.DataTable

        $null = $datatable.Columns.Add("Id") 
        $null = $datatable.Columns.Add("ATTUID") 
        $null = $datatable.Columns.Add("Lastname")
        $null = $datatable.Columns.Add("Firstname")
        $null = $datatable.Columns.Add("CUID")
        $null = $datatable.Columns.Add("BLSUID")
        $null = $datatable.Columns.Add("BLSCUID")
        $null = $datatable.Columns.Add("HRID")
        $null = $datatable.Columns.Add("MgrATTUID")
        $null = $datatable.Columns.Add("JobChangeDate")

        return ,$dataTable
    }
    end
    {
    }
}