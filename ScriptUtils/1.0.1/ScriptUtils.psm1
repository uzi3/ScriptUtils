#Get public and private function definition files.
$Public  = @( Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -Recurse -ErrorAction SilentlyContinue )
$Private = @( Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -Recurse -ErrorAction SilentlyContinue )

#Dot source the files
Foreach ($import in @($Public + $Private))
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







#Add checks for different OS and versions



#Get OS details
# Get Disk, RAM and CPU details
#Export-TimeandDate





<#

function Repair-FileName {
    [CmdletBinding()]
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
#}


#>