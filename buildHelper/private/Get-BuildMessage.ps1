function Get-BuildMessage {
    # [CmdletBinding()]
    # param(
    #     [Switch]$Start,
    #     [Switch]$Stop,
    #     [Switch]$Success,
    #     [Switch]$Failed,
    #     [Switch]$StopSuccess,
    #     [Switch]$StopFailed
    # )

    # Switch ($PSBoundParameters.Keys)
    # {
    #     'Start' { $iconUrl = ":bomb:" }
    #     'Stop' { $iconUrl = "$($Script:BuildHelper.SlackIconBaseUrl)/stop.png" }
    #     'Success' { $iconUrl = ":white_check_mark:" }
    #     'Failed' { $iconUrl = ":x:" }
    #     'StopSuccess' { $iconUrl = ":eight_spoked_asterisk:" }
    #     'StopFailed' { $iconUrl = ":bomb:" }
    # }

    @{
        Channel = $Script:BuildHelper.SlackChannel
        IconUrl = "$($Script:BuildHelper.SlackIconBaseUrl)/invoke-build-logo-75.png"
        AsUser = $false
        Username = $Script:BuildHelper.SlackBotUsername   
    }
}
