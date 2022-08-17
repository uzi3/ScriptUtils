function Test-FileName {
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param (
        # Parameter help description
        [Parameter(Mandatory=$true,
                    ValueFromPipeline = $true,
                    ValueFromPipelineByPropertyName = $true,
                    Position = 0)
        ]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name
    )

    Process
    {
        If ($Name -eq ""){Return $false; break}
        !($Name -match '[#<>:`/\\|?*]')
    }

    <#
        .SYNOPSIS
        Unlike Reapir-FileName, Test-FileName will only check supplied file name as per Microsoft standards and returns result in True or False.

        .DESCRIPTION
        Checks for any invalid character in supplied name and returns result.
        If the supplied name contains invalid characters, the result will be false.
        If the supplied name is as per Microsoft's file naming standard, the result will be true.

        .PARAMETER Name
        Specifies the name that needs to be checked.

        .INPUTS
        None. You can pipe objects to Test-FileName.

        .OUTPUTS
        System.Boolean. Test-FileName returns a boolean value based on the check.

        .EXAMPLE
        PS> Test-FileName -Name "My File"
        True

        .EXAMPLE
        PS> Test-FileName -Name "My\File"
        False

        .EXAMPLE
        PS> Test-FileName -Name "File #<>:`"/\|?*Name"
        False
    #>
}