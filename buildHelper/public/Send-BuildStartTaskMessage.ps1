function Send-BuildStartTaskMessage {
    [CmdletBinding()]
    param(
        [object]$Task
    )

    $message = Get-BuildMessage -Start

    $primaryAttachment = @{
        Color = '#228B22' 
        Title = ":arrow_forward: Starting Task: $($Task.Name)"
        Text = "Time: $($Task.Started.ToString('yyyy-MM-dd hh:mm:ss'))"
        Fallback = "Starting Task: $($Task.Name)"
    }

    $null = New-SlackMessageAttachment @primaryAttachment |
        New-SlackMessage @message |
        Send-SlackMessage
}