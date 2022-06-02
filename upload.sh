#!/bin/bash -e

message() {
  if [[ $auth -eq -1   ]]; then
    echo "You token/password in ~/.azure/azure-build-key.txt is not right"
  fi
  echo "No credentials present for the Azure CLI"
  echo "You can log in the azure portal and then run this again or add the password for the service principal in the ~/.azure/azure-build-key.txt file "
  echo "You can find the service principal password in 1password in infrastructure under the Azure 'service-principal Cloud-Image-Build' name"
}

auth=-1
if [[ ! -e ~/.azure ]]; then
  echo "Trying to connect to azure using token from Browser login"
  tl=$(az storage blob show -c public -n nsolid-quick-start.json --account-name nodesourcearmtemplates > /dev/null 2>&1 ; echo $?)
else
  echo "Trying to connect to azure using service principal"
  auth=$(az login --service-principal -u 5ec337b0-2f46-4ef1-a336-41782a78dacf -p $(cat ~/.azure/azure-build-key.txt) --tenant 303c34b0-e6cc-4ed4-bc66-99f6ae15f78d > /dev/null 2>&1; echo $?)
  tl=$(az storage blob show -c public -n nsolid-quick-start.json --account-name nodesourcearmtemplates > /dev/null 2>&1 ; echo $?)
fi
if [[ $tl -gt 0   ]]; then
   message
   exit 1
else 
   echo "Processing blobs"   
fi   
az storage blob upload --container-name public --name nsolid-quick-start.json --file templates/nsolid-quick-start.json --account-name nodesourcearmtemplates --overwrite
az storage blob upload --container-name public --name nsolid-console-only.json --file templates/nsolid-console-only.json --account-name nodesourcearmtemplates --overwrite
az storage blob upload --container-name public --name nsolid-runtime-only.json --file templates/nsolid-runtime-only.json --account-name nodesourcearmtemplates --overwrite
echo "Templates Updated"
