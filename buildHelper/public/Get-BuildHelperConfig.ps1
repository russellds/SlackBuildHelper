Function Get-BuildHelperConfig {
    [cmdletbinding(DefaultParameterSetName = 'source')]
    param(
        [parameter(ParameterSetName='source')]
        [ValidateSet("BuildHelper","BuildHelper.xml")]
        $Source = "BuildHelper",

        [parameter(ParameterSetName='path')]
        [parameter(ParameterSetName='source')]
        $Path = "$ModuleRoot\BuildHelper.xml"
    )
    
    if($PSCmdlet.ParameterSetName -eq 'source' -and $Source -eq "BuildHelper" -and -not $PSBoundParameters.ContainsKey('Path'))
    {
        $Script:BuildHelper
    }
    else
    {

        Import-Clixml -Path $Path
    }
}
