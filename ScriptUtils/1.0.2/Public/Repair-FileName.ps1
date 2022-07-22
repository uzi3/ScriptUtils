function Repair-FileName {
    [CmdletBinding()]
    [OutputType([String])]
    param (
        # Parameter help description
        [Parameter(Mandatory=$true,
                    ValueFromPipeline = $true,
                    ValueFromPipelineByPropertyName = $true,
                    Position = 0)
        ]
        [string]
        $Name
    )

    Process
    {
        @("#","<",">",":","`"","/","\","|","?","*") | ForEach-Object {$Name = ($Name).Replace("$_","")}
        Return $Name
    }

    <#
        .SYNOPSIS
        Checks and rectify supplied file name as per Microsoft standards.

        .DESCRIPTION
        Checks for any invalid character in supplied name and removes it.

        .PARAMETER Name
        Specifies the name that needs to be rectified.

        .INPUTS
        None. You can pipe objects to Repair-FileName.

        .OUTPUTS
        System.String. Repair-FileName returns a string with acceptable file name.

        .EXAMPLE
        PS> Repair-FileName -Name "My\File"
        MyFile

        .EXAMPLE
        PS> Repair-FileName -Name "File #<>:`"/\|?*Name"
        File Name
    #>
}