function Invoke-KB4Method {
    <#
    .SYNOPSIS
    Invocation of the KnowBe4 API call
    #>
    
    param (
        [Parameter(Mandatory = $true)]
        [string]$Uri,

        [Parameter(Mandatory = $true)]
        [string]$Method,

        [string]$Body
    )
    
    #Retrieve Configuration Values
    $config = Get-KB4Config
    $apiKey = $config.apiKey
    $baseUrl = "https://us.api.knowbe4.com"
    $targetUrl = $baseUrl + $Uri

    # Create headers
    $headers = @{
        "Authorization" = "Bearer $apiKey"
        "Accept" = "application/json"
    }


    # Set mandatory parameters
    $splatParameters = @{
        Uri         = $targetUrl
        Method      = $Method
        Headers     = $headers
    }

    if ($Body) {
        $splatParameters.Add("Body", $Body)
    }

    # Invoke the API
    try {
        $webResponse = Invoke-RestMethod @splatParameters
    }
    catch {
        throw "Error: Bad response received."
    }

    if ($webResponse) {
        return $webResponse
    }
    
}
    