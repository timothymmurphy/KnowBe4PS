# KnowBe4PS
A PowerShell API wrapper for KnowBe4.

# Setup
## PowerShell Gallery Installation
1. Open PowerShell and run `Install-Module -Name KnowBe4PS` to install the module from PowerShell Gallery
2. Open PowerShell and run `Import-Module KnowBe4PS` to import the module
3. Next run `Set-KB4Config` to create your `config.json` file with your appropriate API key. After this has been generated, all of the commands in this module will work.

    - Example: `Set-KB4Config -ApiKey "YOUR_API_KEY"`

## Manual Installation
1. Extract `KnowBe4PS` folder contents to one of the following directories:
    - `C:\Users\$username\Documents\WindowsPowerShell\Modules\KnowBe4PS` (local user scoped installation)
    - `C:\Program Files\WindowsPowerShell\Modules\KnowBe4PS` (global system installation)
    
2. Open PowerShell and Run `Import-Module KnowBe4PS` to import the module  

3. Next run `Set-KB4Config` to create your `config.json` file with your appropriate API key. After this has been generated, all of the commands in this module will work.

    - Example: `Set-KB4Config -ApiKey "YOUR_API_KEY"`

# Commands
## Reporting API
- Get-KB4Account
- Get-KB4User
- Get-KB4Group
- Get-KB4TrainingCampaign
- Get-KB4TrainingEnrollment
