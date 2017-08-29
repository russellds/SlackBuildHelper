function Send-BuildStopMessage {
    [CmdletBinding()]
    param(
        [string[]]$BuildTask
    )

    $buildTaskString = ($BuildTask -join ', ')

    $primaryAttachment = @{
        Text = "Notify List: $(Get-BuildNotifyList)"
    }
    
    if ($script:failedTask) {
        $message = Get-BuildMessage -StopFailed

        $primaryAttachment.Color = '#FF0000'
        $primaryAttachment.Title = ":bomb: Build Failed: $buildTaskString"
        $primaryAttachment.Fallback = "Build Failed: $buildTaskString"
    }
    else {
        $message = Get-BuildMessage -StopSuccess

        $primaryAttachment.Color = '#228B22' 
        $primaryAttachment.Title = ":thumbsup: Finished Build: $buildTaskString"
        $primaryAttachment.Fallback = "Finished Build: $buildTaskString"
    }

    $null = New-SlackMessageAttachment @primaryAttachment |
        New-SlackMessage @message |
        Send-SlackMessage
}