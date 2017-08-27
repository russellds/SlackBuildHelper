function Get-BuildNotifyList {
    $notifyList = @()

    foreach($notifyUser in $Script:BuildHelper.SlackNotifyList) {
        $slackUser = Get-SlackUser -Name $notifyUser

        $notifyList += "<@$($slackUser.ID)|$notifyUser>"
    }

    $notifyList -join ', '
}