Function Get-SlackBuildHelperConfig {
    [cmdletbinding(DefaultParameterSetName = 'source')]
    param(
        [parameter(ParameterSetName='source')]
        [ValidateSet("SlackBuildHelper","SlackBuildHelper.xml")]
        $Source = "SlackBuildHelper",

        [parameter(ParameterSetName='path')]
        [parameter(ParameterSetName='source')]
        $Path = "$ModuleRoot\SlackBuildHelper.xml"
    )
    
    if($PSCmdlet.ParameterSetName -eq 'source' -and $Source -eq "SlackBuildHelper" -and -not $PSBoundParameters.ContainsKey('Path'))
    {
        $Script:SlackBuildHelper
    }
    else
    {

        Import-Clixml -Path $Path
    }
}
