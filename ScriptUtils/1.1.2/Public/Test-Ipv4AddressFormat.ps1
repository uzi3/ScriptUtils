function Test-Ipv4AddressFormat {
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
        $IP
    )

    Process
    {
        $Parts = $IP -split "\."

        foreach ($Part in $Parts) {
            try {
                ([int]$Part).GetType().name -eq "Int32" | Out-Null
            }
            catch [System.Management.Automation.PSInvalidCastException] {
                Return $false
                Break
            }
            catch{
                Return $false
                Break
            }
        }


        If ((
            (([int]$Parts[0] -in 0..255) -and ($parts[0].length -in 1..3)) -and
            (([int]$Parts[1] -in 0..255) -and ($parts[1].length -in 1..3)) -and
            (([int]$Parts[2] -in 0..255) -and ($parts[2].length -in 1..3)) -and
            (([int]$Parts[3] -in 0..255) -and ($parts[3].length -in 1..3))
        ) -and ($IP -match "\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3}"))
        {Return $true}
        else
        {Return $false}
    }

    <#
        .SYNOPSIS
        Checks whether supplied IP address is valid and returns true if valid.

        .DESCRIPTION
        Checks whether supplied IP address is valid and returns true if valid.
        Will return false if either of the octect has value greater than 255.
        Will return false if either of the octet has less than 0 or more than 3 decimals.

        .PARAMETER IP
        Specifies the IP address that needs to be verified.

        .INPUTS
        None. You can pipe objects to Test-Ipv4AddressFormat.

        .OUTPUTS
        System.Boolean. Test-Ipv4AddressFormat returns a boolean value based on final result.

        .EXAMPLE
        Below is an example of a valid IP address. Hence the result will be True.

        PS> "192.168.1.255" | Test-Ipv4AddressFormat
        True

        .EXAMPLE
        The last octet in this example crosses maximum value of 255. Hence the result will be False.

        PS> "192.168.1.256" | Test-Ipv4AddressFormat
        False

        .EXAMPLE
        The last octet in this example contains 4 digits. Hence the result will be False.

        PS> "192.168.1.2555" | Test-Ipv4AddressFormat
        False

        .EXAMPLE
        The last octet in this example contains a negative number. Hence the result will be False.

        PS> "192.168.1.-2" | Test-Ipv4AddressFormat
        False

        .EXAMPLE
        The last octet in this example has blank value. Hence the result will be False.

        PS> "192.168.1." | Test-Ipv4AddressFormat
        False

        .EXAMPLE
        The last octet in this example contains alphabets. Hence the result will be False.

        PS> "192.168.1.av" | Test-Ipv4AddressFormat
        False

        .EXAMPLE
        The last octet in this example contains symbols and alphabet. Hence the result will be False.

        PS> "192.168.1.3*&" | Test-Ipv4AddressFormat
        False

        .EXAMPLE
        The last octet in this example is missing. Hence the result will be False.

        PS> "192.168.1" | Test-Ipv4AddressFormat
        False

        #>
}