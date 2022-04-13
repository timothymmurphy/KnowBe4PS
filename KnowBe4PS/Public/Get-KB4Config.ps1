#Credit to https://mattbobke.com/2018/11/12/building-a-powershell-module-part-3-json-config-files-are-awesome/ for inspiration
function Get-KB4Config {
    <#
        .SYNOPSIS
        Get KnowBe4 API configuration.

        .DESCRIPTION
        Get KnowBe4 API configuration.

        .EXAMPLE
        Get-KB4Config
    #>

    [CmdletBinding()]
    param()

    try {
        Write-Verbose -Message 'Getting content of config.json and returning as a PSCustomObject.'
        $config = Get-Content -Path "$PSScriptRoot\..\config.json" -ErrorAction 'Stop' | ConvertFrom-Json

        $config = [PSCustomObject] @{
            apiKey = $config.apiKey;
        }

        return $config

    } 
    catch {
        throw "Unable to find existing configuration file. Use 'Set-KB4Config' to create one."
    }
}