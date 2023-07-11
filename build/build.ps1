# Build configures the environment for run by installing dependencies.
$spConfig = Get-Content -Path ..\.config\serviceprincipal.json | ConvertFrom-Json

PowerShell
$env:ARM_CLIENT_ID = "$spConfig.ServicePrincipalName"
$env:ARM_CLIENT_SECRET = "$spConfig.ServicePrincipalSecret"
$env:ARM_TENANT_ID = "$spConfig.TenantId"
$env:ARM_SUBSCRIPTION_ID = "spConfig.SubscriptionId"

Write-Output "Checking dependencies..."

../build/check-dependencies.ps1
