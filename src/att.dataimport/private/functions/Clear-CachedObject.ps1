function Clear-CachedObject
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true)]
        [string]
        $Name
    )

    Clear-Variable -Name "ATT.DATAIMPORT.$Name" -Scope "Script" -Force
}