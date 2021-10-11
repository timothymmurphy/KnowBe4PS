<#
    .SYNOPSIS
    Retrieves KnowBe4 account information.
    Official KnowBe4 documentation: https://developer.knowbe4.com/rest/reporting#tag/Account/paths/~1v1~1account/get

    .EXAMPLE
    Get-KB4Account

#>

function Get-KB4Account {
    param ()

    $Parameters = @{
        Uri           = "/v1/account"
        Method        = "Get"
    }

    $result = Invoke-KB4Method @Parameters

    $result
}