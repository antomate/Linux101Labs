## FILE/DIRECTORY OPERATIONS

FILE/DIRECTORY OPERATIONS
pwd	Show current directory (present working directory)
cd	Change directory (‘~’ or empty for home, ‘..’ for parent, ‘-’ for previous)
ls	List files (‘-a’ for all, ‘-R’ for recursive, ‘-l’ for permissions)
mv	Move or rename file
cp	Copy files (or directory with ‘-R’ parameter)
find	Locate files and directories based on complex queries (name, perm, regex…)
mkdir	Create directory
rmdir	Delete directory
rm	Delete file (or directory with ‘-R’ parameter)
touch	Update file’s last modified metadata (used generally to create empty files)
chmod	Change permissions of a file or directory
chown	Change user ownership of a file or directory
chgrp	Change group ownership of a file or directory (chown can be used as well)
umask	Change default umask to remove inherited permissions
gzip	Compress files and directories (‘bzip2’ and ‘xz’ have higher compression rate)
gunzip	De-compress ‘*.gz’ archives (‘bunzip2’ for ‘*.bz2’ archives)
tar	Create archives (uncompressed by default .tar but can be compressed to .tar.gz)

$ mkdir cooldir ; ls
$ cd cooldir ; touch cool ; ls
$ mv cool pascool ; ls
$ cp pascool cool ; find /home/ -name "cool*"
$ chmod ug+x,o-w cool ; ls -l cool
$ chmod 755 cool ; ls -l cool
$ sudo chgrp root cool ; ls -l cool
$ sudo chown root cool ; ls -l cool
$ sudo chown anto:anto cool ; ls -l cool
$ tar -cf cool.tar cool pascool ; ls
$ gzip cool.tar ; ls
$ rm cool pascool ; ls
$ tar -xzf cool.tar.gz ; ls
$ cd ..
$ rm -R cooldir

## DAILY COMMANDS

DAILY COMMANDS
man	Query “Manual pages” (‘-f’ to list dedicated pages on a topic, ‘-k’ to list all pages with reference to a topic)
info	Query “GNU info pages”
echo	Display a line of text
wget	Basic web client to perform http/ftp requests (often used to download files)
su	Substitute to a specific user, ‘root’ if no argument is specified
sudo	Elevate privileges temporarily using current user context and password (‘-i’ to preserve target user environments, ‘-s’ to start a new shell instead of an individual command)
ssh-keygen	Menu driven tool to generate key pairs for SSH authentication (default algorithm is RSA)
ssh	Establish a Secure Shell connection to a remote host using. It can also be used to redirect specific port to a remote host with TCP forwarding or all traffic with SSH tunneling.
shutdown	Manage power control (‘-r’ for reboot’, ‘-h’ for shutdown)

$ man woman
$ man man
$ man -f sudo
$ man –k sudo
$ info sudo
$ wget microsoft.com
$ su
$ echo "anto ALL=(ALL) ALL" > /etc/sudoers.d/anto
$ chmod 440 /etc/sudoers.d/anto
$ exit
$ ssh-keygen –t rsa –b 2048
$ chmod 600 id.rsa
$ ssh anto@nixvm.westeurope.cloudapp.azure.com
$ sudo shutdown –r +3 “shutting down for kernel update”
$ sudo shutdown now


## PACKAGE OPERATIONS

PACKAGE OPERATIONS
apt-get	High level package manager for Debian and Ubuntu
apt-cache	Utility to query packages and show information from the repositories
apt-file	Utility to query files within packages
apt	Utility replacing apt-get and apt-cache
dpkg	Low level package manager for Debian and Ubuntu (format .deb)
yum	High level package manager for SUSE, Red Hat and CentOS
rpm	Low level package manager and package format for Debian and Ubuntu
whereis	Locate tools and applications (better result than ‘which’)

$ wget https://updates.insomnia.rest/downloads/ubuntu/latest -O insomnia.deb
$ sudo dpkg -I insomnia.deb
$ sudo dpkg -i insomnia.deb
$ sudo dpkg -r insomnia.deb
$ apt search apache2-dev
$ apt show apache2-dev
$ sudo apt update
$ sudo apt install apache2-dev
$ sudo apt remove apache2-dev
$ sudo apt update && apt upgrade


## FILE OPERATIONS

FILE OPERATIONS
tee	Display the standard output (stdin) and saves it to a file
cat	Read, display and combine files
more	Display large files page after page (‘space bar’, ‘return’)
less	Display a large files page after page (directional arrows, ‘G’ to reach the end, ‘/’ to search and ‘n’ to move across found occurrences, ‘q’ to quit)
head	Display only the first ‘n’ lines of a file
tail	Display only the last ‘n’ lines of a file (‘-f’ for “tailing” a log file as appended)
wc	Show number of lines, words and characters in one or multiple files
diff	Compare files and directories (diff3 can compare 3 files)
grep	Search for patterns in text files and streams
awk	Text processing based on a dedicated query language
sed	Filter and substitute characters in text files, streams and file/directory names
sort	Sort text files entries/lines and streams in ascending or descending order
uniq	Remove duplicate entries/lines in text files (once sorted with ‘sort’)
paste	Combine lines from different files
join	Combine lines of files based on common fields
cut	Extract column from a file
split	Breaks up large files into multiple files of equal size
tr	Translate characters in text files and streams

$ echo “Apache related packages :” >> pkg1.txt
$ cat pkg1.txt
$ apt-cache search apache | tee -a pkg1.txt
$ apt-cache search apache > pkg2.txt
$ less pkg1.txt
$ head -5 pkg1.txt
$ tail -5 pkg1.txt
$ wc pkg1.txt
$ diff pkg1.txt pkg2.txt
$ awk -F: '{print "name:"$1" home:"$6}' /etc/passwd | grep /home
$ cat /etc/passwd | grep /home | sed -e 's|/home|~|' | grep '~' | sort
$ echo -e "Casey Ryback\nJohn McClane\nJack Ryan\nCasey Ryback" | sort | uniq -c
$ echo -e "Casey Ryback\nJohn McClane\nJack Ryan\nCasey Ryback" | sort | uniq
$ echo -e "Casey Ryback\nJohn McClane\nJack Ryan\nCasey Ryback" > heroes
$ sort –u heroes
$ echo -e "Bill Strannix\nHans Gruber\nSean Miller" > foes
$ paste heroes foes
$ echo -e "1 foo\n2 bar" > part1
$ echo -e "1 bar\n2 foo" > part2
$ join part1 part2
$ join part1 part2 | cut -d ' ' -f 1,3
$ wc -l /var/log/dpkg.log
$ split /var/log/dpkg.log dpkg
$ ls -l dpkg*
$ tr abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ < heroes > capheroes
$ cat capheroes
$ rm dpkg*
$ rm *oes
$ rm part*
$ rm pkg*


## EDITORS

### Nano
Info
Ctrl G 	Show help menu
Ctrl C 	Show current line number and file information
Ctrl W 	Find a word or phrase. Hit Ctrl+R to move into replace mode. Alternatively hit Ctrl+T to go to a specific line

Input/Ouput
Ctrl X 	Exit nano. You will be prompted to save your file if you haven't
Ctrl O 	Save a contents without exiting. Hit Ctrl+T to select an existing file
Ctrl R 	Read a text file. Hit Ctrl+T to select an existing file
Ctrl T 	When saving or reading a file, opens a browser that allows you to select a filename from a list of files and directories

Editing
Ctrl K 	Cut a line into the clipboard. You can press this repeatedly to cut multiple lines
Ctrl U 	Uncut text. You can press this repeatedly to past multiple to past multiple time
BackSpace 	Delete character currently in front of the cursor
Ctrl D 	Delete character currently under the cursor
Ctrl J 	Justify a paragraph of text

Navigation
← ↑ → → 	Move the cursor
Ctrl A 	Move to beginning of line
Ctrl E 	Move to end of line
Ctrl Y 	Move down a page
Ctrl V 	Move up a page
Ctrl _ 	Move to a specific line
Ctrl C 	Find out what line the cursor is currently on

### Vim

Exiting
:w 	write (save) the file, but don't exit
:wq 	write (save) and quit
:x 	write (save) and quit
:q 	quit (fails if there are unsaved changes)
:q! 	quit and throw away unsaved changes
:qa 	quit all buffers and windows
ZZ 	write (save) current file, if modified, and quit
ZQ 	quit without checking for change

Cut and Paste
yy 	yank (copy) a line
2yy 	yank (copy) 2 lines
:n,Ny 	yank lines n through N
yw 	yank (copy) word
y$ 	yank (copy) to end of line
p 	put (paste) the clipboard after cursor
P 	put (paste) before cursor
dd 	delete (cut) a line
2dd 	delete (cut) 2 lines
:n,Nd 	delete lines n through N
dw 	delete (cut) word
D 	delete (cut) to the end of the line
d$ 	delete (cut) to the end of the line
x 	delete (cut) character

Cursor Movement
h 	move cursor left
j 	move cursor down
k 	move cursor up
l 	move cursor right
w 	jump forwards to the start of a word
W 	jump forwards to the start of a word (words can contain punctuation)
e 	jump forwards to the end of a word
E 	jump forwards to the end of a word (words can contain punctuation)
b 	jump backwards to the start of a word
B 	jump backwards to the start of a word (words can contain punctuation)
0 	jump to the start of the line
^ 	jump to the first non-blank character of the line
$ 	jump to the end of the line
G 	go to the last line of the document
nG 	go to line number n
:n 	go to line number n
'' 	To the position before the latest jump, / where the last "m'" / "m`" command was given.
fx 	jump to next occurrence of character x
tx 	jump to one character before the character x
} 	jump to next paragraph
{ 	jump to previous paragraph
H 	jump to home (top) of screen
L 	jump to last line of screen
M 	jump to middle of screen
3, f, x 	jump to 3rd instance of character x forward from cursor on current line.
3, F, x 	jump to 3rd instance of character x back from cursor on current line.

Editing
r 	replace a single character
J 	join line below to the current one
cc 	change (replace) entire line
cw 	change (replace) to the end of the word
c$ 	change (replace) to the end of the line
s 	delete character and substitute text
S 	delete line and substitute text (same as cc)
xp 	transpose two letters (delete and paste)
u 	undo
Ctrl r 	redo
. 	repeat last command

Insert Mode - Inserting/Appending Text
i 	insert before the cursor
I 	insert at the beginning of the line
a 	insert (append) after the cursor
A 	insert (append) at the end of the line
o 	append (open) a new line below the current line
O 	append (open) a new line above the current line
ea 	insert (append) at the end of the word
Esc 	exit insert mode


## BLOCK DEVICE OPERATIONS

BLOCK DEVICE OPERATIONS
lsblk	Show tree view of block devices (disks, partitions, logical volumes)
fdisk	Menu driven tool to manage partitions and disk geometry (LBA/CHS)
parted	Menu driven or unattended tool to manage partitions and disk geometry
mkfs	Format partitions from disk or image (mkfs.[fstype] = mkfs -t [fstype])
mount	Attach a volume to a directory (mount point)
umount	Detach a volume mounted to a directory
fsck	Check filesystem consistency (‘-t’ is optional)
df	Show disk free and occupied space per device (‘-T’ to display filesystem type, ‘-h’ for ‘human’ readability)
du	Show disk usage per directories (‘-a’ for all, ‘-c’ for total, ‘-h’ for ‘human’ readability
dd	File copy/convert tool used for various block device related tasks (disk backup/copy/clone, disk wipe, disk image)

$ dd if=/dev/zero of=imagefile bs=1M count=1024
$ sudo losetup /dev/loop0 imagefile
$ losetup -a
$ sudo parted -s /dev/loop0 mklabel msdos
$ sudo parted -s /dev/loop0 unit MB mkpart primary ext4 1 1024
$ sudo fdisk -l /dev/loop0
$ ls -l /dev/loop0*
$ sudo mkfs.ext4 /dev/loop0p1
$ sudo fsck -f -t ext4 /dev/loop0p1
$ mkdir mntpoint
$ sudo mount /dev/loop0p1 mntpoint
$ df -Th
$ du -cha mntpoint
$ sudo umount mntpoint
$ df -Th
$ rmdir mntpoint
$ sudo losetup -d /dev/loop0
$ losetup -a
$ rm imagefile


## LVM & RAID OPERATIONS

LVM & RAID OPERATIONS
pvcreate	Convert a partition to a physical volume
pvdisplay	Show physical volumes
pvremove	Remove a partition from physical volumes
vgcreate	Create a volume group
vgdisplay	Show volume groups
vgextend	Extend a volume group with new physical volume(s)
vgreduce	Shrink volume group
lvcreate	Create a logical volume from volume group
lvextend	Increase size of a logical volume*
lvreduce	Reduce size of a logical volume*
mdam	Manage RAID configuration

$ sudo pvcreate /dev/sdb1 /dev/sdb2 /dev/sdc1
$ sudo vgcreate vg1 /dev/sdb1 /dev/sdb2
$ sudo pvcreate /dev/sdc1
$ sudo pvextend vg1 /dev/sdc1
$ sudo lvcreate --name lv1 --size 40G vg1
$ sudo lvcreate --name lv2 --size 100G vg1
$ sudo mkfs -t ext4 /dev/vg1/lv1
$ sudo mkfs -t ext4 /dev/vg1/lv2
$ mkdir /data /backup
$ sudo mount /dev/vg1/lv1 /data 
$ sudo mount /dev/vg1/lv2 /backup
$ df -h


## NETWORK MANAGEMENT

NETWORK MANAGEMENT
hostname	Print or modify the hostname for the current session
hostnamectl	Modify the hostname persistently across reboot
dig	Perform fwd and rev name resolution with more details than ‘host’ and ‘nslookup’ commands
ifconfig	Legacy tool to manage network interface configuration. It is now superseded by ‘ip link’
route	Legacy tool to manage network routing configuration. It is now superseded by ‘ip route’
ip	Tool to manage network interface configuration and routes
netstat	Show network statistics
ss	Show network statistics with more advanced capabilities than ‘netstat’
mtr	Network ‘live’ (like top) troubleshooting tool merging ‘ping’ and ‘traceroute’ capability

$ sudo hostnamectl set-hostname CoolHost
$ hostname
$ cat /etc/hosts
$ cat /etc/resolv.conf
$ dig avanade.com
$ ifconfig
$ route
$ ip link show up | grep "eth“
$ ip address show | grep "eth"
$ ip route
$ netstat
$ ss
$ mtr avanade.com


## ENVIRONMENT CONFIGURATION

ENVIRONMENT CONFIGURATION
env	List all current session’s environment variables (user-wide and system-wide)
export	Export a variable to make it persistent for the child process
unset	Clear an environment variable
cron	Task scheduler configured with the cron table
crontab -e	Crontab editor (prompt to select the preferred text editor the first launch)
crontab -l	List existing crontab for the current user
crontab entries	Crontab entries is a schedule and a task to execute :
-	Schedule based on the minute, the hour, the day of the month, the month and the day of the week : MIN HOUR DOM MON DOW
> [0-59] [0-23] [1-31] [1-12] [0-6]
-	User : Only exists in the master cron table “/etc/crontab”
-	Task : command to run

$ echo $SHELL
$ export VAR='testval'
$ echo $VAR
$ echo $PATH
$ export PATH=$HOME/bin:$PATH
$ echo $PATH
$ export {http,https,ftp}_proxy='user1:P%40ssw0rd@http://myproxysrv.com:8080'
$ env | grep "8080"
$ unset {http,https,ftp}_proxy
$ cat /etc/crontab
$ crontab -e
$ (crontab -l ; echo "0 5 * * 1 tar -zcf /var/backups/home.tgz /home/") | crontab -
$ crontab –l
$ sudo cat /var/spool/cron/crontabs/anto
$ cat ~/.bashrc


## PROCESS MANAGEMENT

PROCESS MANAGEMENT
ps	Show processes ()
pstree	Show process tree (‘a’ to show parameter and ‘p’ to show PID)
killall	Equivalent to ‘kill’ command to send signals to processes such as SIGKILL to terminate a process
systemctl	Start, stop, query and configure processes managed by Systemd (‘q’ to quit)

$ ps -elf
$ ps -auxf
$ pstree -p
$ dd if=/dev/urandom of=/dev/null &
$ pstree -p
$ killall -SIGKILL dd
$ systemctl list-units --type=service --state=running
$ systemctl status lxd-containers.service
$ sudo systemctl restart lxd-containers.service
$ systemctl status lxd-containers.service
$ sudo systemctl disable lxd-containers.service

SYSTEMD SERVICE DEFINITION
[Unit]
Description=OpenBSD Secure Shell server
After=network.target auditd.service
ConditionPathExists=!/etc/ssh/sshd_not_to_be_run

[Service]
EnvironmentFile=-/etc/default/ssh
ExecStart=/usr/sbin/sshd -D $SSHD_OPTS
ExecReload=/bin/kill -HUP $MAINPID
KillMode=process
Restart=on-failure

[Install]
WantedBy=multi-user.target
Alias=sshd.service


## MONITORING

MONITORING
top	Real time display of process activities and their compute resource utilization (‘q’ to quit)
iotop	Real time display of process activities and their storage resource utilization (‘q’ to quit)
uptime	Show system uptime since the last boot
iostat	Shows per storage device I/O statistics (‘-k’ for stats in kilobytes and ‘-m’ for megabytes)

$ top
$ sudo iotop
$ uptime
$ iostat -k


## USER MANAGEMENT

IDENTITY MANAGEMENT
whoami	Show current user name
id	Shows user’s info UID, GID of the primary group, name and GIP of secondary group(s)
groups	Show user’s group membership
useradd	Create a new user account (‘-m’ to force the creation of a home directory if not by default)
usermod	Modify user account including group membership (‘-L’ for locking the account, ‘-U’ for unlocking)
userdel	Delete user (‘-r’ to include deletion of its home directory)
passwd	Change user password
groupadd	Create a new group
groupdel	Delete a group

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
$ groups mrcool
$ sudo groupadd cool
$ sudo usermod -a -G cool mrcool
$ id mrcool
$ groups mrcool
$ sudo groupdel cool
$ sudo userdel -r mrcool