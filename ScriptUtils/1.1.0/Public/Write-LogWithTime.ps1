function Write-LogWithTime {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true,
                    ValueFromPipeline = $true,
                    Position = 0)
        ]
        [string]
        $Description,

        [Parameter(Mandatory=$false,
        ValueFromPipeline = $false,
        Position = 1)
        ]
        [string]
        $LogPath = "$env:HOMEPATH\LogFile.log"
    )

    Process
    {
        $DateFormat = $((Get-Date -Format 'MM/dd/yyyy hh:mm:ss tt').ToString())
        $DateFormat + " - " + "$Description" | Out-File $LogPath -Append
    }

    <#
        .SYNOPSIS
        Outputs the supplied content/string to a log file with date and time.

        .DESCRIPTION
        Outputs the supplied content/string to a log file with date and time.

        .PARAMETER Description
        The content/string that you want to export in the log file.

        .PARAMETER LogPath
        The complete path of the log file. If not mentioned, default log path will be used.
        Default log path will be under user's homepath directory. For example \Users\Admin\LogFile.log.

        .INPUTS
        You can pipe content to Write-LogWithTime.

        .OUTPUTS
        None. All contents will be exported in the log file and won't be displayed on screen.

        .EXAMPLE
        Below example will export the contents in C:\Temp\MyLogFile.log. Below you can see the contents of logfile with the exact date and time.

        PS> Write-LogWithTime -Description "Beginning Script Execution" -LogPath C:\Temp\MyLogFile.log
        03-22-2022 05:13:46 PM - Beginning Script Execution

        .EXAMPLE
        Write-LogWithTime accepts value from pipeline. In below example, the computer name is passed through pipeline to Write-LogWithTime function.
        Since the value for LogPath is not passed, the default LogPath location which is user's homepath will be used to export logs.

        PS> $env:COMPUTERNAME
        03-22-2022 05:37:02 PM - DESKTOP-EPHQ95K

        .EXAMPLE
        The next example is same as that of previous one except that in this example we have explicitly mentioned log file path.

        PS> $env:COMPUTERNAME | Write-LogWithTime -LogPath C:\temp\MyLogFile.log
        03-22-2022 05:37:02 PM - DESKTOP-EPHQ95K
    #>
}