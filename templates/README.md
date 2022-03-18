# N|Solid Resource Manager Templates

_These templates are provided as a way of getting started. Before using them in production please make the necessary security updates._

**Logging In**

Access any virtual machine created by these templates with the following SSH credentials:
* Username: `ns`
* Password: `nodesource`

**Before Running Templates:**

Make a copy of our N|Solid VHDs into your own account for use in the templates.

```
$ az storage blob copy start --destination-blob nsolid-runtime-disk --destination-container <your-storage-container> --source-uri https://nsoliddisks.blob.core.windows.net/system/Microsoft.Compute/Images/nsolid/4.7.1-runtime-osDisk.479efbad-a0b2-4f6e-89c8-593837e47ea8.vhd --account-name <your-storage-account-name>
```

```
$ az storage blob copy start --destination-blob nsolid-console-disk --destination-container <your-storage-container> --source-uri https://nsoliddisks.blob.core.windows.net/system/Microsoft.Compute/Images/nsolid/4.7.1-console-osDisk.5bb247a1-df48-491a-a26b-178fb8c3c441.vhd --account-name <your-storage-account-name>
```

## `nsolid-quick-start`

### Description

Runs N|Solid Console and N|Solid Runtime on separate VMs. The VMs are configured with a Security Group that allows traffic from `0.0.0.0/0` on ports `22`, `80`, `9001`, `9002`, `9003`. Both of the VMs get Public IP addresses. Simply load the N|Solid Console IP address in your browser to view the console. In your N|Solid Runtime, set the `NSOLID_COMMAND` variable to the N|Solid Console IP address to send data from your processes.

|  Required Parameter  |                Description                 |
|----------------------|--------------------------------------------|
|     `consoleVhd`     |   URI of Console VHD in your own account   |
|     `runtimeVhd`     |   URI of Runtime VHD in your own account   |

|   Resources Created           |
|-------------------------------|
|       1 Virtual Network       |
|         2 VM Instances        |
|      2 Network Interfaces     |
|       2 Security Groups       |
|         2 Public IPs          |

>_The West US region is currently the only region supported for this template._

### Deploy

[![Launch ARM Template](/images/deploy-to-azure.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fnodesourcearmtemplates.blob.core.windows.net%2Fpublic%2Fnsolid-quick-start.json)

## `nsolid-console-only`

### Description

Creates an N|Solid Console VM only. The VM is configured with a Security Group that allows traffic from `0.0.0.0/0` on ports `22`, `80`, `9001`, `9002`, `9003`. The VM gets a Public IP addresses. Simply load the N|Solid Console IP address in your browser to view the console.

|  Required Parameter  |                Description                 |
|----------------------|--------------------------------------------|
|     `consoleVhd`     |   URI of Console VHD in your own account   |

|   Resources Created           |
|-------------------------------|
|       1 Virtual Network       |
|         1 VM Instance         |
|       1 Network Interface     |
|        1 Security Group       |
|          1 Public IP          |

>_The West US region is currently the only region supported for this template._

### Deploy

[![Launch ARM Template](/images/deploy-to-azure.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fnodesourcearmtemplates.blob.core.windows.net%2Fpublic%2Fnsolid-console-only.json)

## `nsolid-runtime-only`

### Description

Creates an N|Solid Runtime VM only. The VM is configured with a Security Group that allows traffic from `0.0.0.0/0` on port `22`. The VM gets a Public IP addresses. Simply SSH into the VM and point it at your N|Solid Console with the `NSOLID_COMMAND` environment variable.

|  Required Parameter  |                Description                 |
|----------------------|--------------------------------------------|
|     `runtimeVhd`     |   URI of Runtime VHD in your own account   |

|   Resources Created           |
|-------------------------------|
|       1 Virtual Network       |
|         1 VM Instance         |
|       1 Network Interface     |
|        1 Security Group       |
|          1 Public IP          |

>_The West US region is currently the only region supported for this template._

### Deploy

[![Launch ARM Template](/images/deploy-to-azure.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fnodesourcearmtemplates.blob.core.windows.net%2Fpublic%2Fnsolid-runtime-only.json)
