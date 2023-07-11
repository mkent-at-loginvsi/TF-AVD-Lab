param(
    [Parameter(Mandatory=$true)]
    [string]$ServicePrincipalName,
    [Parameter(Mandatory=$true)]
    [string]$ServicePrincipalSecret,
    [Parameter(Mandatory=$true)]
    [string]$TenantId,
    [Parameter(Mandatory=$false)]
    [string]$SubscriptionId
)
# Check if script is running in PowerShell
If(!$Host){Write-Output "Run this script from PowerShell."}
$ErrorActionPreference = "Stop"

# Check for Azure CLI
If(!(az --version)){Write-Output "Install the Azure CLI from https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?view=azure-cli-latest"}

# May need to check az cli version later

# Login to Azure CLI
az login

# Set the default subscription

az account set --subscription $SubscriptionId

# Create the service principal (az ad sp create-for-rbac -n "$ServicePrincipalName"
$sp = az ad sp create-for-rbac --name $ServicePrincipalName --password $ServicePrincipalSecret --role contributor --scopes /subscriptions/$SubscriptionId

# Get the service principal object
$sp = az ad sp show --id $sp.appId

#Update json file
$sp | ConvertTo-Json | Out-File -FilePath ..\.config\ServicePrincipalName.json