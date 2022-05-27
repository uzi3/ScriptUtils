function Test-IfAdmin {
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param ()

    Process
    {
        ([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups.value -contains "S-1-5-32-544"
    }

    <#
        .SYNOPSIS
        Verifies whether current user is running under admin context of local computer.

        .DESCRIPTION
        Many operations require admin privileges to execute successfully.
        Use this command when you want to verify whether the user account which is used to execute the script is running
        under admin privilege.

        .INPUTS
        None. You can pipe user context to Test-IfAdmin.

        .OUTPUTS
        System.Boolean. Test-IfAdmin returns a boolean value.

        .EXAMPLE
        When you start PowerShell console or script with Run as Administrator option.

        PS> Test-IfAdmin
        True

        .EXAMPLE
        When you start PowerShell console or script without Run as Administrator option.

        PS> Test-IfAdmin
        False

        .EXAMPLE
        You can use Test-IfAdmin before performing any operation that requires admin privilge. In this example we are creating Test Folder under C:\Windows\System32 that requires admin privilege. It will perform the action only if the user is
        admin. Else it will dosplay error.


        PS> If (Test-IfAdmin)
                {
                    New-Item -ItemType Directory -Name TestFolder -Path C:\Windows\System32
                }
                Else
                {
                    Write-Error "Insufficient Permission"
                }


        Directory: C:\Windows\System32

        Mode                 LastWriteTime         Length Name
        ----                 -------------         ------ ----
        d----          14-03-2022    23:15                TestFolder
    #>
}