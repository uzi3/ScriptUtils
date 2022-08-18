function Get-SubnetFormat()
{
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory=$true,
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [Alias("subnet")]
        $InputSubnet
    )

    Process
    {
        $SubnetObj = [PSCustomObject]@{
        CIDR = ''
        SubnetMask = ''
        WildcardMask = ''
        }

        switch ($InputSubnet)
        {
            "255.255.255.255" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "32"; $SubnetObj.WildcardMask = "0.0.0.0"; Break}
            "255.255.255.254" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "31" ; $SubnetObj.WildcardMask = "0.0.0.1"; Break}
            "255.255.255.252" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "30" ; $SubnetObj.WildcardMask = "0.0.0.3"; Break}
            "255.255.255.248" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "29" ; $SubnetObj.WildcardMask = "0.0.0.7"; Break}
            "255.255.255.240" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "28" ; $SubnetObj.WildcardMask = "0.0.0.15"; Break}
            "255.255.255.224" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "27" ; $SubnetObj.WildcardMask = "0.0.0.31"; Break}
            "255.255.255.192" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "26" ; $SubnetObj.WildcardMask = "0.0.0.63"; Break}
            "255.255.255.128" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "25" ; $SubnetObj.WildcardMask = "0.0.0.127"; Break}
            "255.255.255.0" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "24" ; $SubnetObj.WildcardMask = "0.0.0.255"; Break}
            "255.255.254.0" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "23" ; $SubnetObj.WildcardMask = "0.0.1.255"; Break}
            "255.255.252.0" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "22" ; $SubnetObj.WildcardMask = "0.0.3.255"; Break}
            "255.255.248.0" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "21" ; $SubnetObj.WildcardMask = "0.0.7.255"; Break}
            "255.255.240.0" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "20" ; $SubnetObj.WildcardMask = "0.0.15.255"; Break}
            "255.255.224.0" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "19" ; $SubnetObj.WildcardMask = "0.0.31.255"; Break}
            "255.255.192.0" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "18" ; $SubnetObj.WildcardMask = "0.0.63.255"; Break}
            "255.255.128.0" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "17" ; $SubnetObj.WildcardMask = "0.0.127.255"; Break}
            "255.255.0.0" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "16" ; $SubnetObj.WildcardMask = "0.0.255.255"; Break}
            "255.254.0.0" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "15" ; $SubnetObj.WildcardMask = "0.1.255.255"; Break}
            "255.252.0.0" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "14" ; $SubnetObj.WildcardMask = "0.3.255.255"; Break}
            "255.248.0.0" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "13" ; $SubnetObj.WildcardMask = "0.7.255.255"; Break}
            "255.240.0.0" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "12" ; $SubnetObj.WildcardMask = "0.15.255.255"; Break}
            "255.224.0.0" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "11" ; $SubnetObj.WildcardMask = "0.31.255.255"; Break}
            "255.192.0.0" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "10" ; $SubnetObj.WildcardMask = "0.63.255.255"; Break}
            "255.128.0.0" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "9" ; $SubnetObj.WildcardMask = "0.127.255.255"; Break}
            "255.0.0.0" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "8" ; $SubnetObj.WildcardMask = "0.255.255.255"; Break}
            "254.0.0.0" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "7" ; $SubnetObj.WildcardMask = "1.255.255.255"; Break}
            "252.0.0.0" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "6" ; $SubnetObj.WildcardMask = "3.255.255.255"; Break}
            "248.0.0.0" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "5" ; $SubnetObj.WildcardMask = "7.255.255.255"; Break}
            "240.0.0.0" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "4" ; $SubnetObj.WildcardMask = "15.255.255.255"; Break}
            "224.0.0.0" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "3" ; $SubnetObj.WildcardMask = "31.255.255.255"; Break}
            "192.0.0.0" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "2" ; $SubnetObj.WildcardMask = "63.255.255.255"; Break}
            "128.0.0.0" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "1" ; $SubnetObj.WildcardMask = "127.255.255.255"; Break}
            "0.0.0.0" {$SubnetObj.SubnetMask = "$InputSubnet"; $SubnetObj.CIDR = "0" ; $SubnetObj.WildcardMask = "255.255.255.255"; Break}
            "32" {$SubnetObj.SubnetMask = "255.255.255.255"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "0.0.0.0"; Break}
            "31" {$SubnetObj.SubnetMask = "255.255.255.254"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "0.0.0.1"; Break}
            "30" {$SubnetObj.SubnetMask = "255.255.255.252"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "0.0.0.3"; Break}
            "29" {$SubnetObj.SubnetMask = "255.255.255.248"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "0.0.0.7"; Break}
            "28" {$SubnetObj.SubnetMask = "255.255.255.240"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "0.0.0.15"; Break}
            "27" {$SubnetObj.SubnetMask = "255.255.255.224"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "0.0.0.31"; Break}
            "26" {$SubnetObj.SubnetMask = "255.255.255.192"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "0.0.0.63"; Break}
            "25" {$SubnetObj.SubnetMask = "255.255.255.128"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "0.0.0.127"; Break}
            "24" {$SubnetObj.SubnetMask = "255.255.255.0"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "0.0.0.255"; Break}
            "23" {$SubnetObj.SubnetMask = "255.255.254.0"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "0.0.1.255"; Break}
            "22" {$SubnetObj.SubnetMask = "255.255.252.0"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "0.0.3.255"; Break}
            "21" {$SubnetObj.SubnetMask = "255.255.248.0"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "0.0.7.255"; Break}
            "20" {$SubnetObj.SubnetMask = "255.255.240.0"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "0.0.15.255"; Break}
            "19" {$SubnetObj.SubnetMask = "255.255.224.0"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "0.0.31.255"; Break}
            "18" {$SubnetObj.SubnetMask = "255.255.192.0"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "0.0.63.255"; Break}
            "17" {$SubnetObj.SubnetMask = "255.255.128.0"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "0.0.127.255"; Break}
            "16" {$SubnetObj.SubnetMask = "255.255.0.0"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "0.0.255.255"; Break}
            "15" {$SubnetObj.SubnetMask = "255.254.0.0"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "0.1.255.255"; Break}
            "14" {$SubnetObj.SubnetMask = "255.252.0.0"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "0.3.255.255"; Break}
            "13" {$SubnetObj.SubnetMask = "255.248.0.0"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "0.7.255.255"; Break}
            "12" {$SubnetObj.SubnetMask = "255.240.0.0"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "0.15.255.255"; Break}
            "11" {$SubnetObj.SubnetMask = "255.224.0.0"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "0.31.255.255"; Break}
            "10" {$SubnetObj.SubnetMask = "255.192.0.0"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "0.63.255.255"; Break}
            "9" {$SubnetObj.SubnetMask = "255.128.0.0"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "0.127.255.255"; Break}
            "8" {$SubnetObj.SubnetMask = "255.0.0.0"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "0.255.255.255"; Break}
            "7" {$SubnetObj.SubnetMask = "254.0.0.0"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "1.255.255.255"; Break}
            "6" {$SubnetObj.SubnetMask = "252.0.0.0"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "3.255.255.255"; Break}
            "5" {$SubnetObj.SubnetMask = "248.0.0.0"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "7.255.255.255"; Break}
            "4" {$SubnetObj.SubnetMask = "240.0.0.0"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "15.255.255.255"; Break}
            "3" {$SubnetObj.SubnetMask = "224.0.0.0"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "31.255.255.255"; Break}
            "2" {$SubnetObj.SubnetMask = "192.0.0.0"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "63.255.255.255"; Break}
            "1" {$SubnetObj.SubnetMask = "128.0.0.0"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "127.255.255.255"; Break}
            "0" {$SubnetObj.SubnetMask = "0.0.0.0"; $SubnetObj.CIDR = "$InputSubnet"; $SubnetObj.WildcardMask = "255.255.255.255"; Break}
            "0.0.0.0" {$SubnetObj.SubnetMask = "255.255.255.255"; $SubnetObj.CIDR = "32"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            "0.0.0.1" {$SubnetObj.SubnetMask = "255.255.255.254"; $SubnetObj.CIDR = "31"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            "0.0.0.3" {$SubnetObj.SubnetMask = "255.255.255.252"; $SubnetObj.CIDR = "30"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            "0.0.0.7" {$SubnetObj.SubnetMask = "255.255.255.248"; $SubnetObj.CIDR = "29"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            "0.0.0.15" {$SubnetObj.SubnetMask = "255.255.255.240"; $SubnetObj.CIDR = "28"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            "0.0.0.31" {$SubnetObj.SubnetMask = "255.255.255.224"; $SubnetObj.CIDR = "27"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            "0.0.0.63" {$SubnetObj.SubnetMask = "255.255.255.192"; $SubnetObj.CIDR = "26"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            "0.0.0.127" {$SubnetObj.SubnetMask = "255.255.255.128"; $SubnetObj.CIDR = "25"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            "0.0.0.255" {$SubnetObj.SubnetMask = "255.255.255.0"; $SubnetObj.CIDR = "24"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            "0.0.1.255" {$SubnetObj.SubnetMask = "255.255.254.0"; $SubnetObj.CIDR = "23"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            "0.0.3.255" {$SubnetObj.SubnetMask = "255.255.252.0"; $SubnetObj.CIDR = "22"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            "0.0.7.255" {$SubnetObj.SubnetMask = "255.255.248.0"; $SubnetObj.CIDR = "21"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            "0.0.15.255" {$SubnetObj.SubnetMask = "255.255.240.0"; $SubnetObj.CIDR = "20"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            "0.0.31.255" {$SubnetObj.SubnetMask = "255.255.224.0"; $SubnetObj.CIDR = "19"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            "0.0.63.255" {$SubnetObj.SubnetMask = "255.255.192.0"; $SubnetObj.CIDR = "18"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            "0.0.127.255" {$SubnetObj.SubnetMask = "255.255.128.0"; $SubnetObj.CIDR = "17"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            "0.0.255.255" {$SubnetObj.SubnetMask = "255.255.0.0"; $SubnetObj.CIDR = "16"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            "0.1.255.255" {$SubnetObj.SubnetMask = "255.254.0.0"; $SubnetObj.CIDR = "15"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            "0.3.255.255" {$SubnetObj.SubnetMask = "255.252.0.0"; $SubnetObj.CIDR = "14"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            "0.7.255.255" {$SubnetObj.SubnetMask = "255.248.0.0"; $SubnetObj.CIDR = "13"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            "0.15.255.255" {$SubnetObj.SubnetMask = "255.240.0.0"; $SubnetObj.CIDR = "12"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            "0.31.255.255" {$SubnetObj.SubnetMask = "255.224.0.0"; $SubnetObj.CIDR = "11"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            "0.63.255.255" {$SubnetObj.SubnetMask = "255.192.0.0"; $SubnetObj.CIDR = "10"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            "0.127.255.255" {$SubnetObj.SubnetMask = "255.128.0.0"; $SubnetObj.CIDR = "9"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            "0.255.255.255" {$SubnetObj.SubnetMask = "255.0.0.0"; $SubnetObj.CIDR = "8"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            "1.255.255.255" {$SubnetObj.SubnetMask = "254.0.0.0"; $SubnetObj.CIDR = "7"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            "3.255.255.255" {$SubnetObj.SubnetMask = "252.0.0.0"; $SubnetObj.CIDR = "6"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            "7.255.255.255" {$SubnetObj.SubnetMask = "248.0.0.0"; $SubnetObj.CIDR = "5"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            "15.255.255.255" {$SubnetObj.SubnetMask = "240.0.0.0"; $SubnetObj.CIDR = "4"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            "31.255.255.255" {$SubnetObj.SubnetMask = "224.0.0.0"; $SubnetObj.CIDR = "3"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            "63.255.255.255" {$SubnetObj.SubnetMask = "192.0.0.0"; $SubnetObj.CIDR = "2"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            "127.255.255.255" {$SubnetObj.SubnetMask = "128.0.0.0"; $SubnetObj.CIDR = "1"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            "255.255.255.255" {$SubnetObj.SubnetMask = "0.0.0.0"; $SubnetObj.CIDR = "0"; $SubnetObj.WildcardMask = "$InputSubnet"; Break}
            default {Return "Invalid subnet entered"}
        }
        Return $SubnetObj
    }

    <#
    .SYNOPSIS
    Returns Subnet mask, Wildcard mask and CIDR format of a subnet.

    .DESCRIPTION
    Returns Subnet mask, Wildcard mask and CIDR format of a subnet.
    You can supply input in either of the format, i.e. CIDR, subnet mask or
    wildcard mask.

    .PARAMETER InputSubnet
    Specifies the subnet that will be supplied. This has to be a valid subnet mask
    either in CIDR, subnet mask or wildcard mask format. 

    .INPUTS
    None. You can also pipe subnet to Get-SubnetFormat.

    .OUTPUTS
    System.Object. Get-SubnetFormat returns a PSCustomObject object.

    .EXAMPLE
    PS> Get-SubnetFormat 255.255.254.0
    CIDR SubnetMask    WildcardMask
    ---- ----------    ------------
    23   255.255.254.0 0.0.1.255

    .EXAMPLE
    PS> Get-SubnetFormat 23
    CIDR SubnetMask    WildcardMask
    ---- ----------    ------------
    23   255.255.254.0 0.0.1.255
    
    .EXAMPLE
    PS> Get-SubnetFormat "127.255.255.255"
    CIDR SubnetMask WildcardMask
    ---- ---------- ------------
    1    128.0.0.0  127.255.255.255
    
    #>
}