#Credit to https://mattbobke.com/2018/11/12/building-a-powershell-module-part-3-json-config-files-are-awesome/ for inspiration
function Set-KB4Config {
    <#
        .SYNOPSIS
        Set required values to make KnowBe4 API calls.

        .DESCRIPTION
        Sets the API Key which is required to make any API calls.

        .PARAMETER ApiKey
        API Key

        .EXAMPLE
        Set-KB4Config -ApiKey "API_Key_goes_here"
    #>

    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$ApiKey
    )

    try {
        Write-Verbose -Message 'Checking for existing configuration...'
        $config = Get-Content -Path "$PSScriptRoot\..\config.json" -ErrorAction 'Stop' | ConvertFrom-Json
        Write-Verbose -Message 'Stored config.json found.'
    } 
    catch {
        Write-Verbose -Message 'No configuration found - starting with empty configuration.'
        $jsonString = @'
{   
    "apiKey" : ""
}
'@
        $config = $jsonString | ConvertFrom-Json
    }

    if ($ApiKey) {$config.apiKey = $ApiKey}

    Write-Verbose -Message 'Setting config.json.'
    $config | ConvertTo-Json | Set-Content -Path "$PSScriptRoot\..\config.json"
}