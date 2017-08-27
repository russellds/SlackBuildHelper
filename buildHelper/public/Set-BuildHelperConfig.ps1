function Set-BuildHelperConfig {
    [cmdletbinding()]
    param(
        [string]$SlackChannel,
        [string]$SlackIconBaseUrl,
        [string]$SlackBotUserName,
        [string[]]$SlackNotifyList,
        [string]$Path = "$ModuleRoot\BuildHelper.xml"
    )

    Switch ($PSBoundParameters.Keys)
    {
        'SlackChannel'{ $Script:BuildHelper.SlackChannel = $SlackChannel }
        'SlackIconBaseUrl'{ $Script:BuildHelper.SlackIconBaseUrl = $SlackIconBaseUrl }
        'SlackBotUserName'{ $Script:BuildHelper.SlackBotUserName = $SlackBotUserName }
        'SlackNotifyList'{ $Script:BuildHelper.SlackNotifyList = $SlackNotifyList }
    }

    $Script:BuildHelper |
        Export-Clixml -Path $Path -Force

}
