# LAB 02

## Login to Azure and deploy the VM template

1. Solution

```Bash
$ az login
```

2. Solution

```Bash
$ az group create --name Linux101Labs --location "West Europe"
$ az group deployment create -g Linux101Labs --template-file Linux101Labs/lab-01/vmTemplate.json --parameters Linux101Labs/lab-01/vmTemplate.parameters.json | grep "ssh "
```

## Enter remote session on the new VM

Solution

```Bash
$ ssh adminuser<YourIndex>@linux101Lab01<YourIndex>.westeurope.cloudapp.azure.com
```

## Create logical volumes, format and mount

1. Solution

```Bash
$ lsblk
```

2. Solution

```Bash
$ sudo pvcreate /dev/sdc /dev/sdd
$ sudo vgcreate vg1 /dev/sdc /dev/sdd
$ sudo lvcreate --name lv1 --size 30G vg1
$ sudo lvcreate --name lv2 --size 5G vg1
```

3. Solution

```Bash
$ sudo mkfs -t ext4 /dev/vg1/lv1
$ sudo mkfs -t ext4 /dev/vg1/lv2
$ df -h
```

4. Solution

```Bash
$ sudo mkdir /data1 /data2
$ sudo mount /dev/vg1/lv1 /data1 
$ sudo mount /dev/vg1/lv2 /data2
$ df -h
```

## Create a blob file and mount it as a loop device pesistently using **fstab**

1. Solution

```Bash
$ dd if=/dev/zero of=imagefile bs=1M count=1024
$ sudo losetup /dev/loop0 imagefile
$ losetup -a
```

2. Solution

```Bash
$ sudo parted -s /dev/loop0 mklabel msdos
$ sudo parted -s /dev/loop0 unit MB mkpart primary ext4 1 1024
$ sudo fdisk -l /dev/loop0
```

3. Solution

```Bash
$ sudo mkfs.ext4 /dev/loop0p1
$ sudo mkdir /mntpoint
$ sudo mount /dev/loop0p1 /mntpoint
```

4. Solution

```Bash
$ df -h
$ echo "/dev/loop0p1      /mntpoint      ext4      defaults      0 0" | sudo tee -a /etc/fstab
```

## Verify network configuration for all NICs

1. Solution

```Bash
$ cat /etc/hosts
$ cat /etc/resolv.conf
```

2. Solution

```Bash
$ ip address show
$ ip route show
```

3. Solution

```Bash
$ mtr avanade.com
```

## Create a cron task

1. Solution

```Bash
$ crontab -l
$ crontab -e
```

2. Solution

```Cron
0 0 * * 0 tar -zcf /home/adminuser<YourIndex>/bckloopdevice.tgz /home/adminuser<YourIndex>/imagefile
```

3. Solution

```Bash
$ sudo crontab -l
$ sudo crontab -e
```

4. Solution

```Cron
0 23 1 * * sudo fsck -f -t ext4 /dev/loop0p1
```