## Create a new Azure resource group
resourcegroup=rgheimdall001dev
az group create --name $resourcegroup --location eastus

## Validate deployment and parameters
az deployment group validate \
--resource-group $resourcegroup \
--template-file function-app.json \
--parameters @function-app.parameters.json

## Review the deployment without deploying
az deployment group what-if \
--name HeimdallFunctionAppDeployment \
--resource-group $resourcegroup \
--template-file function-app.json \
--parameters @function-app.parameters.json

## Create a new deployment
az deployment group create \
--name HeimdallFunctionAppDeployment \
--resource-group $resourcegroup \
--template-file function-app.json \
--parameters @function-app.parameters.json
