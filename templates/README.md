# N|Solid Resource Manager Templates

_These templates are provided as a way of getting started. Before using them in production please make the necessary security updates._

**Logging In**

Access any virtual machine created by these templates with the following SSH credentials: 
* Username: `ns`
* Password: `nodesource`

## `nsolid-quick-start`

### Description

Runs N|Solid Console and N|Solid Runtime on separate VMs. The VMs are configured with a Security Group that allows traffic from `0.0.0.0/0` on ports `22`, `80`, `9001`, `9002`, `9003`. Both of the VMs get Public IP addresses. Simply load the N|Solid Console IP address in your browser to view the console. In your N|Solid Runtime, set the `NSOLID_COMMAND` variable to the N|Solid Console IP address to send data from your processes.

|   Resources Created           |
|-------------------------------|
|       1 Virtual Network       |
|        2 EC2 Instances        |
|      2 Network Interfaces     |
|       2 Security Groups       |
|         2 Public IPs          |

>_The West US region is currently the only region supported for this template._

### Deploy

[![Launch ARM Template](/images/deploy-to-azure.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fnodesourcearmtemplates.blob.core.windows.net%2Fpublic%2Fnsolid-quick-start.json)
