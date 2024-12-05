#!/bin/bash

declare -a SRC_SUBSCRIPTION_IDS=("")

EVENTGRID_NAME_01=""
EVENTGRID_NAME_02=""
FUNC_SUBSCRIPTION_ID=""
FUNC_RESOURCEGROUP_NAME=""
FUNCTION_APP_NAME=""
FUNCTION_NAME=""

for sub in "${SRC_SUBSCRIPTION_IDS[@]}"
do
    echo "--------------------------------------------------------------------------------"
    printf '%40s\n' "Subscription: $sub"
    echo "--------------------------------------------------------------------------------"

    echo "--------------------------------------------------------------------------------"
    printf '%40s\n' "Creating Event Grid and Advanced Filter 01"
    echo "--------------------------------------------------------------------------------"
    az eventgrid event-subscription create --name "$EVENTGRID_NAME_01" \
    --source-resource-id /subscriptions/$sub \
    --endpoint-type azurefunction \
    --endpoint /subscriptions/$FUNC_SUBSCRIPTION_ID/resourceGroups/$FUNC_RESOURCEGROUP_NAME/providers/Microsoft.Web/sites/$FUNCTION_APP_NAME/functions/$FUNCTION_NAME \
    --included-event-types Microsoft.Resources.ResourceWriteSuccess \
    --advanced-filter data.authorization.action StringNotContains Microsoft.Resources/tags/write \
    --advanced-filter data.operationName StringContains \
    Microsoft.Network/trafficmanagerprofiles/write \
    Microsoft.network/loadBalancers/write \
    Microsoft.Network/applicationgateways/write \
    Microsoft.Network/ApplicationGatewayWebApplicationFirewallPolicies \
    microsoft.servicenetworking/trafficcontrollers \
    microsoft.containerservice/managedclusters \
    Microsoft.ContainerRegistry/registries \
    Microsoft.DocumentDb/databaseAccounts \
    Microsoft.ManagedIdentity/userAssignedIdentities \
    Microsoft.Kubernetes/connectedClusters \
    Microsoft.HybridCompute/machines \
    microsoft.operationalinsights/workspaces \
    microsoft.network/frontdoors \
    microsoft.network/expressroutecircuits \
    microsoft.network/vpngateways \
    microsoft.network/virtualwans \
    Microsoft.Compute/disks/write \
    Microsoft.Compute/virtualMachines/write \
    Microsoft.KeyVault/vaults/write \
    Microsoft.RecoveryServices/vaults/write \
    Microsoft.Storage/storageAccounts/write \
    Microsoft.Compute/snapshots/write \
    Microsoft.Network/NetworkSecurityGroups/write
    

    echo "--------------------------------------------------------------------------------"
    printf '%40s\n' "Creating Event Grid and Advanced Filter 02"
    echo "--------------------------------------------------------------------------------"
    az eventgrid event-subscription create --name "$EVENTGRID_NAME_02" \
    --source-resource-id /subscriptions/$sub \
    --endpoint-type azurefunction \
    --endpoint /subscriptions/$FUNC_SUBSCRIPTION_ID/resourceGroups/$FUNC_RESOURCEGROUP_NAME/providers/Microsoft.Web/sites/$FUNCTION_APP_NAME/functions/$FUNCTION_NAME \
    --included-event-types Microsoft.Resources.ResourceWriteSuccess \
    --advanced-filter data.authorization.action StringNotContains Microsoft.Resources/tags/write \
    --advanced-filter data.operationName StringContains \
    Microsoft.web/sites/write \
    Microsoft.automation/automationAccounts/write \
    Microsoft.certificateRegistration/certificateOrders/write \
    Microsoft.operationalInsights/queryPacks/write \
    Microsoft.logic/workflows/write \
    Microsoft.insights/components/write \
    Microsoft.network/virtualNetworks/write \
    Microsoft.DataProtection/BackupVaults/write \
    Microsoft.DBforPostgreSQL/servers/write \
    Microsoft.Network/localnetworkgateways/write \
    Microsoft.Network/virtualnetworkgateways/write \
    Microsoft.Network/natgateways/write \
    Microsoft.Network/applicationgateways/write \
    Microsoft.Network/privateDnsZones/write \
    Microsoft.Network/privateEndpoints/write \
    Microsoft.Network/publicIPAddresses/write \
    Microsoft.Sql/servers/write \
    Microsoft.Compute/images/write \
    Microsoft.ContainerRegistry/registries/write \
    Microsoft.Compute/virtualMachineScaleSets/write \
    Microsoft.Network/networkWatchers/write \
    Microsoft.operationalInsights/workspaces/write \
    Microsoft.Network/networkInterfaces/write \
    Microsoft.web/serverFarms/write

    echo "--------------------------------------------------------------------------------"
    printf '%40s\n' "Subscription: $sub Completed."
    echo "--------------------------------------------------------------------------------"

done