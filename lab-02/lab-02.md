


## Login to Azure

```Bash
az login
```

Create a VM with Azure Cli (multiple data disks and previously created SSH public key)
Enter remote session on the new VM
Create logical volumes, format and mount
Create a blob file and mount it as a loop device
Add entry in the FSTAB for the loop device
Create a cron task to update the package list daily