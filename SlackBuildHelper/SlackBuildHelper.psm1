$Public  = @( Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -ErrorAction SilentlyContinue )
$Private = @( Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -ErrorAction SilentlyContinue )
$ModuleRoot = $PSScriptRoot

#Dot source the files
Foreach($import in @($Public + $Private))
{
    Try
    {
        . $import.fullname
    }
    Catch
    {
        Write-Error -Message "Failed to import function $($import.fullname): $_"
    }
}

#Create / Read config
    if(-not (Test-Path -Path "$PSScriptRoot\SlackBuildHelper.xml" -ErrorAction SilentlyContinue))
    {
        Try
        {
            Write-Warning "Did not find config file $PSScriptRoot\SlackBuildHelper.xml, attempting to create"
            [pscustomobject]@{
                SlackChannel = $null
                SlackIconUrl = $null
                SlackBotUserName = $null
                SlackNotifyList = $null
            } | Export-Clixml -Path "$PSScriptRoot\SlackBuildHelper.xml" -Force -ErrorAction Stop
        }
        Catch
        {
            Write-Warning "Failed to create config file $PSScriptRoot\SlackBuildHelper.xml: $_"
        }
    }

#Initialize the config variable.
    Try
    {
        #Import the config
        $SlackBuildHelper = $null
        $SlackBuildHelper = Get-SlackBuildHelperConfig -Source SlackBuildHelper.xml -ErrorAction Stop

    }
    Catch
    {
        Write-Warning "Error importing SlackBuildHelper config: $_"
    }
