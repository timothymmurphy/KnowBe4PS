<#
    .SYNOPSIS
    Retrieve a list of all Training Enrollments in your KnowBe4 account.
    Official KnowBe4 documentation: https://developer.knowbe4.com/rest/reporting#tag/Training/paths/~1v1~1training~1enrollments/get

    .PARAMETER EnrollmentID
    ID for a specific training enrollment

    .PARAMETER StorePurchaseID
    Returns a list of all training enrollments filtered by a module

    .PARAMETER CampaignID
    Returns a list of all training enrollments filtered by a campaign

    .PARAMETER UserID
    Returns a list of all training enrollments filtered by a user

    .EXAMPLE
    Get-KB4TrainingEnrollment

    Returns a list of all training Enrollments

    .EXAMPLE
    Get-KB4TrainingEnrollment -EnrollmentID 3264 

    Returns information about a specific training Enrollment

#>

function Get-KB4TrainingEnrollment {
    param (
        [int]$EnrollmentID,

        [int]$StorePurchaseID,

        [int]$CampaignID,

        [int]$UserID
    )

    $Parameters = @{
        Uri           = "/v1/training/enrollments"
        Method        = "Get"
    }

    if ($EnrollmentID) {$Parameters.Uri = "$($Parameters.Uri)/$EnrollmentID"}
    if ($StorePurchaseID) {$Parameters.Uri = "$($Parameters.Uri)/?store_purchase_id=$StorePurchaseID"}
    if ($CampaignID) {$Parameters.Uri = "$($Parameters.Uri)/?campaign_id=$CampaignID"}
    if ($UserID) {$Parameters.Uri = "$($Parameters.Uri)/?user_id=$UserID"}
    

    $result = Invoke-KB4Method @Parameters

    $result
}