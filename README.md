![N|Solid](/images/nsolid-azure.png)

# NodeSource N|Solid on Azure

[Azure](https://azure.microsoft.com/en-us/?v=18.07a) is a comprehensive set of cloud services that developers and IT professionals use to build, deploy, and manage applications through a global network of datacenters. Deploy your [N|Solid](https://nodesource.com/products/nsolid) instances to Azure for cloud access to the only Node.js platform built for mission-critical applications.

### License Key
If you don't already have a license key, please visit the NodeSource website to start your [trial service](https://pages.nodesource.com/nsolid-free-trial.html).

## Getting Started with N|Solid on Azure

Easily run N|Solid on Azure using our [Resource Manager](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-portal) templates. You can find a list of templates and their descriptions in the [README](/templates/README.md).

Follow these steps to use the Resource Manager templates in `nsolid-azure`:

1. Make a copy of our N|Solid VHDs into your own account for use in the templates.

```
$ az storage blob copy start --destination-blob nsolid-runtime-disk --destination-container <your-storage-container> --source-uri https://nsoliddisks.blob.core.windows.net/system/Microsoft.Compute/Images/nsolid/4.2.1-runtime-osDisk.1bb89ecc-8e9e-48c3-bf3a-a529488c2d2e.vhd --account-name <your-storage-account-name>
```

```
$ az storage blob copy start --destination-blob nsolid-console-disk --destination-container <your-storage-container> --source-uri https://nsoliddisks.blob.core.windows.net/system/Microsoft.Compute/Images/nsolid/4.2.1-console-osDisk.975fc9ef-dbea-4bc0-93e7-ca0551eba580.vhd --account-name <your-storage-account-name>
```

2. Find the template you want to run in the `/templates` folder, then click the **Deploy to Azure** button. This will open up a Custom Deployment in Azure Resource Manager in your own account.

3. Fill in the required parameters with your VHD URI's created in step 1.

4. Select either an existing Resource Group or create a new one.

5. Set the location to "West US".

6. Agree to the Terms and Conditions.

7. Click the **Purchase** button.

[![Launch ARM Template](/images/deploy-to-azure.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fnodesourcearmtemplates.blob.core.windows.net%2Fpublic%2Fnsolid-quick-start.json)

## N|Solid Image List for Azure

You can also use our N|Solid Images for your own projects. See [IMAGE-LIST.md](IMAGE-LIST.md) for a full list of Image IDs.
