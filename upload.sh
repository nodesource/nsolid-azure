#!/bin/bash -e

if [[ ! -e ~/.azure ]]; then
  echo "No credentials present for the Azure CLI"
  exit 1
fi

az login --service-principal -u 5ec337b0-2f46-4ef1-a336-41782a78dacf -p $(cat ~/.azure/azure-build-key.txt) --tenant 303c34b0-e6cc-4ed4-bc66-99f6ae15f78d
az storage blob upload --container-name public --name nsolid-quick-start/nsolid-deploy.json --file templates/nsolid-quick-start/nsolid-deploy.json --account-name nodesourcearmtemplates
echo "Templates Updated"
