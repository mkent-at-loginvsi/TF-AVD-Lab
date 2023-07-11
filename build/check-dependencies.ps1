if(!(az ad sp list --show-mine --query "[].{id:appId, id:displayName, tenant:appOwnerTenantId}" | grep $ServicePrincipalName)){
    ../build/create-azserviceprinciple.ps1 -ServicePrincipalName $spConfig.ServicePrincipalName -ServicePrincipalSecret $spConfig.ServicePrincipalSecret -TenantId $spConfig.TenantId -SubscriptionId $spConfig.SubscriptionId
}