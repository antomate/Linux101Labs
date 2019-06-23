# LAB 03

This lab focus on managing users and groups as well as well as process management and monitoring of the server's activity.

## Create a new user and initiate its password (user must change its password at next logon)

```Bash
$ whoami
$ cat /etc/passwd
$ cat /etc/group
$ sudo cat /etc/shadow
$ sudo useradd -m mrcool
$ cat /etc/passwd
$ sudo cat /etc/shadow
$ sudo passwd mrcool
$ sudo cat /etc/shadow
$ id mrcool
```

## Create a new group and Add the new user to the new group

```Bash
$ id mrcool
$ groups mrcool
$ sudo groupadd cool
$ sudo usermod -a -G cool mrcool
$ id mrcool
$ groups mrcool
```

## Run a background job and monitor its status

```Bash
$ ps -elf
$ ps -auxf
$ pstree -p
$ dd if=/dev/urandom of=/dev/null &
$ pstree -p
$ killall -SIGKILL dd
$ systemctl list-unit-files --type=service --state=enabled
$ systemctl status lxd-containers.service
$ sudo systemctl restart lxd-containers.service
$ systemctl status lxd-containers.service
$ sudo systemctl disable lxd-containers.service
$ top
$ sudo iotop
$ uptime
$ iostat -k
$ netstat
```

## Change a service configuration and restart it


## Build a C application with make