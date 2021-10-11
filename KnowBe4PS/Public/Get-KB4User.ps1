<#
    .SYNOPSIS
    Retrieve KnowBe4 user information.
    Official KnowBe4 documentation: https://developer.knowbe4.com/rest/reporting#tag/Users

    .PARAMETER Active
    Switch to return only Active users
    
    .PARAMETER Archived
    Switch to return only Archived (disabled) users

    .PARAMETER GroupID
    Returns all users that are members of a specified group

    .PARAMETER ExpandGroup
    Switch that includes additional group information in the response such as the name and type

    .PARAMETER UserID
    Returns information about a specific user

    .EXAMPLE
    Get-KB4User

    Returns a list of all users

    .EXAMPLE
    Get-KB4User -UserID 667542

    Returns a specific user

    .EXAMPLE
    Get-KB4User -Active

    Returns a list of all active users

    .EXAMPLE
    Get-KB4User -GroupID 3264 -ExpandGroup

    Returns a list of all members of the Group, expands group to provide additional details

#>

function Get-KB4User {
    param (
        [switch]$Active,

        [switch]$Archived,

        [int]$GroupID,

        [switch]$ExpandGroup,

        [int]$UserID
    )

    $Parameters = @{
        Uri           = "/v1/users"
        Method        = "Get"
    }

    if ($Active) {$Parameters.Uri = "$($Parameters.Uri)/?status=active"}
    if ($Archived) {$Parameters.Uri = "$($Parameters.Uri)/?status=archived"}
    if ($GroupID) {$Parameters.Uri = "$($Parameters.Uri)/?group_id=$GroupID"}
    if ($ExpandGroup) {$Parameters.Uri = "$($Parameters.Uri)/?expand=group"}
    if ($UserID) {$Parameters.Uri = "/v1/users/$UserID"}
    

    $result = Invoke-KB4Method @Parameters

    $result
}