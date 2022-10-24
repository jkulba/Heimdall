## Create a new Azure resource group
resourcegroup=rgheimdall001dev
az group create --name rgheimdall001dev --location eastus

## Validate deployment and parameters
az deployment group validate \
--resource-group rgheimdall001dev \
--template-file function-app.json \
--parameters @function-app.parameters.json

az deployment group validate --resource-group rgheimdall001dev --template-file function-app.json --parameters @function-app.parameters.json


## Review the deployment without deploying
az deployment group what-if \
--name HeimdallFunctionAppDeployment \
--resource-group rgheimdall001dev \
--template-file function-app.json \
--parameters @function-app.parameters.json

az deployment group what-if --name HeimdallFunctionAppDeployment --resource-group rgheimdall001dev --template-file function-app.json --parameters @function-app.parameters.json

## Create a new deployment
az deployment group create \
--name HeimdallFunctionAppDeployment \
--resource-group $resourcegroup \
--template-file function-app.json \
--parameters @function-app.parameters.json

az deployment group create --name HeimdallFunctionAppDeployment --resource-group rgheimdall001dev --template-file function-app.json --parameters @function-app.parameters.json
