<#
    .SYNOPSIS
    Retrieve KnowBe4 group information.
    Official KnowBe4 documentation: https://developer.knowbe4.com/rest/reporting#tag/Groups

    .PARAMETER Active
    Switch to return only Active groups
    
    .PARAMETER Archived
    Switch to return only Archived (disabled) groups

    .PARAMETER GroupID
    Returns information about a specific group


    .EXAMPLE
    Get-KB4Group

    Returns a list of all groups

    .EXAMPLE
    Get-KB4Group -Active

    Returns a list of all active groups

    .EXAMPLE
    Get-KB4Group -GroupID 3264 

    Returns information about a specific group

#>

function Get-KB4Group {
    param (
        [switch]$Active,

        [switch]$Archived,

        [int]$GroupID
    )

    $Parameters = @{
        Uri           = "/v1/groups"
        Method        = "Get"
    }

    if ($Active) {$Parameters.Uri = "$($Parameters.Uri)/?status=active"}
    if ($Archived) {$Parameters.Uri = "$($Parameters.Uri)/?status=archived"}
    if ($GroupID) {$Parameters.Uri = "$($Parameters.Uri)/$GroupID"}
    

    $result = Invoke-KB4Method @Parameters

    $result
}