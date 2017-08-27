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
    if(-not (Test-Path -Path "$PSScriptRoot\BuildHelper.xml" -ErrorAction SilentlyContinue))
    {
        Try
        {
            Write-Warning "Did not find config file $PSScriptRoot\BuildHelper.xml, attempting to create"
            [pscustomobject]@{
                SlackChannel = $null
                SlackIconUrl = $null
                SlackBotUserName = $null
                SlackNotifyList = $null
            } | Export-Clixml -Path "$PSScriptRoot\BuildHelper.xml" -Force -ErrorAction Stop
        }
        Catch
        {
            Write-Warning "Failed to create config file $PSScriptRoot\BuildHelper.xml: $_"
        }
    }

#Initialize the config variable.
    Try
    {
        #Import the config
        $BuildHelper = $null
        $BuildHelper = Get-BuildHelperConfig -Source BuildHelper.xml -ErrorAction Stop

    }
    Catch
    {
        Write-Warning "Error importing BuildHelper config: $_"
    }
