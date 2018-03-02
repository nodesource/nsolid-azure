# N|Solid Resource Manager Templates

## `nsolid-quick-start`

**Description**

Runs N|Solid Console and N|Solid Runtime on separate VMs. The VMs are configured with a Firewall that allows traffic from `0.0.0.0/0` on ports `22`, `80`, `9001`, `9002`, `9003`. Both of the VMs get Public IP addresses. Simply load the N|Solid Console IP address in your browser to view the console. In your N|Solid Runtime, set the `NSOLID_COMMAND` variable to the N|Solid Console IP address to send data from your processes.

_Resources Created_

|           Resource            |
|-------------------------------|
|        2 EC2 Instances        |
|           1 Firewall          |

**Deploy**

```
$ gcloud deployment-manager deployments create nsolid --config templates/nsolid-quick-start/nsolid.yaml
```
