# LAB 03

## Managing users and groups

1. Solution

```Bash
$ cat /etc/passwd | grep "adminuser"
$ cat /etc/group | grep "adminuser"
$ sudo cat /etc/shadow | grep "adminuser"
```

2. Solution

```Bash
$ sudo useradd -m usertemp
$ cat /etc/passwd | grep "usertemp"
$ sudo cat /etc/shadow | grep "usertemp"
$ sudo passwd usertemp
$ sudo cat /etc/shadow | grep "usertemp"
```

3. Solution

```Bash
$ sudo groupadd grouptemp
$ sudo usermod -a -G grouptemp usertemp
$ id usertemp
```

4. Solution

```Bash
$ sudo userdel -r usertemp
$ sudo groupdel grouptemp
```

## Managing processes and daemons

1. Solution

```Bash
$ ps -elf | grep "bash"
$ ps -elf | grep "<bash PPID>"
$ pstree -p
```

2. Solution

```Bash
$ ping avanade.com &
$ kill -SIGKILL <PID>
```

3. Solution

```Bash
$ systemctl list-units --type=service --state=running
$ systemctl status lxd-containers.service
$ sudo systemctl stop lxd-containers.service
$ sudo systemctl disable lxd-containers.service
```

## Moniroting and troubleshoot

2. Solution

```Bash
$ stress --cpu 2 --io 4 --vm 6 --timeout 200s &
$ jobs
```

1. Solution

```Bash
$ top
$ fg %1
```
2. Solution

```Bash
$ uptime
$ tail /var/log/syslog
$ tail /var/log/auth.log
$ tail /var/log/waagent.log
```

3. Solution

```Bash
$ sudo nohup apt install apache2-dev &
$ tail -f /var/log/apt/history.log
```