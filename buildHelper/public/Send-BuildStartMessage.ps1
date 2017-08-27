function Send-BuildStartMessage {
    [CmdletBinding()]
    param(
        [string[]]$BuildTask
    )

    $message = Get-BuildMessage -Start

    $buildTaskString = ($BuildTask -join ', ')

    $primaryAttachment = @{
        Color = '#228B22' 
        Title = ":running: Starting Build: $buildTaskString"
        Text = "Notify List: $(Get-BuildNotifyList)"
        Fallback = "Starting Build: $buildTaskString"
    }

    $null = New-SlackMessageAttachment @primaryAttachment |
        New-SlackMessage @message |
        Send-SlackMessage
}