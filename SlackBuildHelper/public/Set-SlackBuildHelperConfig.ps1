function Set-SlackBuildHelperConfig {
    [cmdletbinding()]
    param(
        [string]$SlackChannel,
        [string]$SlackIconBaseUrl,
        [string]$SlackBotUserName,
        [string[]]$SlackNotifyList,
        [string]$Path = "$ModuleRoot\SlackBuildHelper.xml"
    )

    Switch ($PSBoundParameters.Keys)
    {
        'SlackChannel'{ $Script:SlackBuildHelper.SlackChannel = $SlackChannel }
        'SlackIconBaseUrl'{ $Script:SlackBuildHelper.SlackIconBaseUrl = $SlackIconBaseUrl }
        'SlackBotUserName'{ $Script:SlackBuildHelper.SlackBotUserName = $SlackBotUserName }
        'SlackNotifyList'{ $Script:SlackBuildHelper.SlackNotifyList = $SlackNotifyList }
    }

    $Script:SlackBuildHelper |
        Export-Clixml -Path $Path -Force

}
