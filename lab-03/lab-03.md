# LAB 03

This lab focus on managing users and groups as well as well as process management and monitoring of the server's activity.

## Managing users and groups

1. Show your user configuration, group membership and credentials information with **cat**. Note that your password has not been defined '!' so technically the account shoud be locked!

```Bash
$ cat /etc/passwd | grep "adminuser"
$ cat /etc/group | grep "adminuser"
$ sudo cat /etc/shadow | grep "adminuser"
```

2. Create a new user "usertemp" using **useradd** and show its user configuration and credentials information using **cat**. Then initiate its password with **passwd**. Show again its credentials information using **cat** and note the difference (user would have to change its password at next logon).

```Bash
$ sudo useradd -m usertemp
$ cat /etc/passwd | grep "usertemp"
$ sudo cat /etc/shadow | grep "usertemp"
$ sudo passwd usertemp
$ sudo cat /etc/shadow | grep "usertemp"
```

3. Create a new group "grouptemp" using **groupadd** then add the new user "usertemp" to the this group using **usermod**. Finally display usertemp group membership

```Bash
$ sudo groupadd grouptemp
$ sudo usermod -a -G grouptemp usertemp
$ id usertemp
```

4. Remove the user "usertemp" including its home directory using **userdel** and delete the group "grouptemp" using **groupdel**.

```Bash
$ sudo userdel -r usertemp
$ sudo groupdel grouptemp
```

## Managing processes and daemons

1. Using **ps** and **pstree** find the parent process for your current bash session

```Bash
$ ps -elf | grep "bash"
$ ps -elf | grep "<bash PPID>"
$ pstree -p
```

2. Start a background task using "&" at the end of a **ping** command. Note the PID of the background task and use it to stop the process with **kill**.

```Bash
$ ping avanade.com &
$ kill -SIGKILL <PID>
```

3. 

```Bash
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


## Build a C application