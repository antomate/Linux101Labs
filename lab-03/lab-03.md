# LAB 03

This lab focus on managing users and groups as well as well as process management and monitoring of the server's activity.

## Managing users and groups

1. Show your user configuration, group membership and credentials information with **cat**. Note that your password has not been defined '!' so technically the account shoud be locked!

2. Create a new user "usertemp" using **useradd** and show its user configuration and credentials information using **cat**. Then initiate its password with **passwd**. Show again its credentials information using **cat** and note the difference (user would have to change its password at next logon).

3. Create a new group "grouptemp" using **groupadd** then add the new user "usertemp" to the this group using **usermod**. Finally display usertemp group membership.

4. Remove the user "usertemp" including its home directory using **userdel** and delete the group "grouptemp" using **groupdel**.

## Managing processes, jobs and daemons

1. Using **ps** and **pstree** find the parent process for your current bash session.

2. Start a background task using "&" at the end of a **ping** command. Note the PID of the background task and use it to stop the process with **kill**.

3. Using **systemctl**, display all running services then show status specifically for "lxd" daemon. Finally stop then disbale the "lxd" daemon.

## Monitoring and troubleshoot

1. Download **stress** tool source code, build it and install it

```Bash
$ apt install gcc
$ sudo apt install make
$ wget http://people.seas.harvard.edu/~apw/stress/stress-1.0.4.tar.gz -O stress-1.0.4.tar.gz
$ tar zxvf stress-1.0.4.tar.gz
$ cd stress-1.0.4
$ ./configure
$ make
$ sudo make install
```

2. Start a **stress** test in the background for the next 200 seconds, then show the job status with **jobs**. The stress test can be configured with the following metrics :
    - 2 CPU processes (--cpu 2)
    - 4 I/O processes (--io 4)
    - 6 memory processes (--vm 6)

1. Monitor system usage with **top** and note the usage of **stress**. Then quit **top** and bring the **stress** job in the foreground with **fg**.

2. Verify the **uptime** of the server, then using **tail** display the last log entries for the following journals :
    - Syslog
    - Authentication
    - Azure agent

3. Start the **loop** bellow in the background which will add new events in the *system journal* using **logger**. Quickly after starting it, use **tail** to display ongoing system events.

```Bash
$ for i in {1..10}; do logger "Your time will expire in $((-$(($i - 10)))) seconds"; sleep 1; done
```