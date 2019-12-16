# LAB 02

This lab focus on deploying a Linux VM in Azure based on the temlate previously configured in "lab-01". SSH will be used to connect to this VM and configure its storage using **LVM**, "loop devices" and **FSTAB** and finally prepare cron jobs.

## Login to Azure and deploy the VM template

1. Login to Azure Resource Manager with **az**.

2. Create a new resource group "Linux101Labs" and deploy the VM template. To find the output of the template with the ssh connection string, pipe the result to a **grep** and look for "ssh ".

## Enter remote session on the new VM

Use the SSH connection string to connect to the VM and confirm when prompted to add your VM fingerprint to the known hosts.

## Create logical volumes, format and mount persistently

1. List the available volumes using **lsblk** and notice "sdc" and "sdd" are raw disk with no partitions.

2. Declare physical volumes for devices "sdc" and "sdd" using **pvcreate**, then create a volume group "vg1" from those two devices suing **vgcreate**. Finally use **lvcreate** to create two logical volume from the "vg1" volume group, "lv1" of 30Go and "lv2" of 5Go.

3. Format the two new volumes "lv1" and "lv2" in "ext4" using **mkfs**.

4. Create two folders "data1" and "data2" at the root of the filesystem, then mount respectively "lv1" and "lv2" to those mounting points using **mount**. Finally show volumes informarion using **df** and create two new entries in **fstab** to peristently mount "data1" and "data2".

## Create and mount a loop device

1. Create a raw 1Go image file filled with zeros using **dd** then using **losetup**, initiate a loopback device "loop0" from the image file and display the loopback device information.

2. In the new loopback device, create a partition using **parted** and show disk information using **fdisk**. The partition must have the following properties :
    - Partition table type : "msdos" (MBR)
    - Partition type : "primary"
    - Format type : "ext4" (note that this will not create and format the filesystem)
    - Partition offset : 1Mb - 1024Mb

3. Format the "loop0p1" partition in "ext4" using **mkfs**, then create a "mntpoint" directory at the root of the filesystem to finally mount the "loop0p1" partition to that directory. Show the volumes informarion using **df**.

## Verify network configuration

1. Display local resolution entrees and DNS resolver configuration using **cat**.

2. Show network configuration and known routes for both ethernet interfaces using **ip**.

3. Use **mtr** to show on going statistics for each network hops to reach "avanade.com".

## Create a cron task

1. List existing **crontab** jobs for current user and if necessary initiate **crontab** and select your default editor.

2. Create a task to backup the "imagefile" created previously to a compresses archive using **tar**. The task must run every sunday at 0:00.

3. List existing **crontab** jobs for root and if necessary initiate **crontab** and select your default editor.

4. Create a task to check with **fsck** the integrity of the loopback device "loop0p1" created previously. The task must run every 1st day of the month at 23:00.