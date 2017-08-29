function Send-BuildStopTaskMessage {
    [CmdletBinding()]
    param(
        [object]$Task
    )

    if ($Task.Error)
    {
        $script:failedTask = $true

        $message = Get-BuildMessage -Failed

        $primaryAttachment = @{
            Color = '#FF0000'
            Title = ":x: Failed Task: $($Task.Name)"
            Fallback = "Failed Task: $($Task.Name)"
            Text = $Task.Error
        }
    }
    else
    {
        $message = Get-BuildMessage -Success

        $primaryAttachment = @{
            Color = '#228B22' 
            Title = ":white_check_mark: Exiting Task: $($Task.Name)"
            Text = "Time: {0:g}" -f $Task.Elapsed
            Fallback = "Exiting Task: $($Task.Name)"
        }
    }

    $null = New-SlackMessageAttachment @primaryAttachment |
        New-SlackMessage @message |
        Send-SlackMessage
}