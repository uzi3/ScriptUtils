function Get-PSInfo {
    Function PSCore
    {
        $HostData = $PSVersionTable
        $HostData += Get-Host | ConvertTo-Json -WarningAction SilentlyContinue | ConvertFrom-Json -AsHashtable -WarningAction SilentlyContinue
        $HostData.Add("ProcessID","$PID")
        [PSCustomObject]$HostData
    }

    Function PSDesktop
    {
        $ImpObj = Get-PSInfo-Desktop #This is a private function
        $HostData = Get-Host

        $ImpObj.Name = $HostData.Name
        $ImpObj.InstanceID = $HostData.InstanceId
        $ImpObj.CurrentCulture = $HostData.CurrentCulture
        $ImpObj.CurrentUICulture = $HostData.CurrentUICulture
        $ImpObj.ProcessID = $PID

        $FinalObj = [PSCustomobject]$PSVersionTable

        foreach ($Prop in $($ImpObj | Get-Member | Where-Object {$_.membertype -eq "NoteProperty"} | select-object -ExpandProperty name))
        {
            $FinalObj | Add-Member -MemberType NoteProperty -Name "$Prop" -Value $ImpObj.$Prop
        }

        $FinalObj
    }


    $PSType = ($PSVersionTable).psedition

    switch ($PSType) {
        "Core" {PSCore}
        "Desktop" {PSDesktop}
    }


    <#
        .SYNOPSIS
        Pulls PowerShell environment and version details.

        .DESCRIPTION
        Pulls PowerShell environment and version details.

        .OUTPUTS
        Get-PSInfo returns a PSCustomObject with PowerShell environment details.

        .EXAMPLE
        The example below simply returns all the details about PowerShell.
        It returns Version, OS, InstanceID information.

        PS> Get-PSInfo

        Version                   : {MinorRevision, Build, Major, MajorRevision…}
        OS                        : Microsoft Windows 10.0.22000
        Platform                  : Win32NT
        UI                        : {RawUI, SupportsVirtualTerminal}
        DebuggerEnabled           : True
        WSManStackVersion         : 3.0
        PrivateData               : {ProgressBackgroundColor, ProgressForegroundColor, FormatAccentColor,
                                    WarningBackgroundColor…}
        SerializationVersion      : 1.1.0.1
        Runspace                  : {ApartmentState, InitialSessionState, RunspaceAvailability, LanguageMode…}
        Name                      : ConsoleHost
        PSCompatibleVersions      : {1.0, 2.0, 3.0, 4.0…}
        PSVersion                 : 7.2.1
        CurrentUICulture          : {LCID, UseUserOverride, IetfLanguageTag, CultureTypes…}
        PSEdition                 : Core
        GitCommitId               : 7.2.1
        PSRemotingProtocolVersion : 2.3
        CurrentCulture            : {LCID, UseUserOverride, IetfLanguageTag, CultureTypes…}
        InstanceId                : 5b26eb39-34ae-48e0-bab5-f8f7ded1742a
        IsRunspacePushed          : False


        .EXAMPLE
        The example below returns detailed PowerShell version information.

        PS> (Get-PSInfo).Version


        Name                           Value
        ----                           -----
        Minor                          12
        MinorRevision                  -1
        MajorRevision                  -1
        Build                          0
        Revision                       -1
        Major                          2021
        #>
}