<#
    .SYNOPSIS
    Retrieve a list of all Training Campaigns in your KnowBe4 account.
    Official KnowBe4 documentation: https://developer.knowbe4.com/rest/reporting#tag/Training/paths/~1v1~1training~1campaigns/get

    .EXAMPLE
    Get-KB4TrainingCampaign

    Returns a list of all training campaigns

    .EXAMPLE
    Get-KB4TrainingCampaign -CampaignID 3264 

    Returns information about a specific training campaign

#>

function Get-KB4TrainingCampaign {
    param (
        [int]$CampaignID
    )

    $Parameters = @{
        Uri           = "/v1/training/campaigns"
        Method        = "Get"
    }

    if ($CampaignID) {$Parameters.Uri = "$($Parameters.Uri)/$CampaignID"}
    

    $result = Invoke-KB4Method @Parameters

    $result
}