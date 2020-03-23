## FILE/DIRECTORY OPERATIONS

COMMAND | DESCRIPTION | EXEMPLE
--- | --- | ---
pwd | Show current directory (present working directory) | pwd
mkdir | Create directory | mkdir cooldir
rmdir | Delete directory | rmdir cooldir
cd | Change directory (‘~’ or empty for home, ‘..’ for parent, ‘-’ for previous) | cd cooldir
touch | Update file’s last modified metadata (used generally to create empty files) | touch cool.txt
chmod | Change permissions of a file or directory | chmod 755 cool.txt
chown | Change user ownership of a file or directory | chown root cool.txt
chgrp | Change group ownership of a file or directory (chown can be used as well) | chgrp root cool.txt
mv | Move or rename file | mv cool.txt pascool.tx
cp | Copy files (or directory with ‘-R’ parameter) | cp pascool.txt cool.txt
ls | List files (‘-a’ for all, ‘-R’ for recursive, ‘-l’ for permissions) | ls -al
find | Locate files and directories based on complex queries (name, perm, regex…) | find /home/ -name "cool*"
tar | Create or extract archives (uncompressed by default .tar but can be compressed to .tar.gz) | tar -cf cool.tar cool.txt pascoo.txt
gzip | Compress files and directories ('-d' can be used for decompress. ‘bzip2’ and ‘xz’ have higher compression rate) | gzip cool.tar
rm | Delete file (or directory with recursive ‘-R’ parameter) | rm -R cooldir

======================================

## DAILY COMMANDS

COMMAND | DESCRIPTION | EXEMPLE
--- | --- | ---
uname | Show system and kernel version information ( '-a' will show ditrib info while -r' will show kernel info) | uname -a
man | Query “Manual pages” (‘-f’ to list dedicated pages on a topic, ‘-k’ to list all pages with reference to a topic) | man -f sudo
info | Query “GNU info pages” | info sudo
echo | Display a line of text | echo "hello world"
wget | Basic web client to perform http/ftp requests (often used to download files) | wget microsoft.com
sudo | Elevate privileges temporarily using current user context and password (‘-i’ to preserve target user environments, ‘-s’ to start a new shell instead of an individual command) | sudo shutdown now
ssh-keygen | Menu driven tool to generate key pairs for SSH authentication (default algorithm is RSA) | ssh-keygen –t rsa –b 2048
ssh | Establish a Secure Shell connection to a remote host using. It can also be used to redirect specific port to a remote host with TCP forwarding or all traffic with SSH tunneling. | ssh anto@nixvm.cool.com
shutdown | Manage power control (‘-r’ for reboot’, ‘-h’ for shutdown) | shutdown now


## PACKAGE OPERATIONS

COMMAND | DESCRIPTION | EXEMPLE
--- | --- | ---
apt | Utility replacing apt-get and apt-cache | dpkg -i insomnia.deb 
dpkg | Low level package manager for Debian and Ubuntu (format .deb) | apt search apache2-dev ; apt show apache2-dev ; apt install apache2-dev
yum | High level package manager for SUSE, Red Hat and CentOS | 
rpm | Low level package manager and package format for Debian and Ubuntu | 
whereis | Locate tools and applications (better result than ‘which’) | 


## FILE OPERATIONS

COMMAND | DESCRIPTION | EXEMPLE
--- | --- | ---
tee | Display the standard output (stdin) and saves it to a file | 
cat | Read, display and combine files | cat pkg1.txt
less | Display a large files page after page (directional arrows, ‘G’ to reach the end, ‘/’ to search and ‘n’ to move across found occurrences, ‘q’ to quit) | less pkg1.txt
head | Display only the first ‘n’ lines of a file | head -5 pkg1.txt
tail | Display only the last ‘n’ lines of a file (‘-f’ for “tailing” a log file as appended) | tail -5 pkg1.txt
wc | Show number of lines, words and characters in one or multiple files | wc pkg1.txt
diff | Compare files and directories (diff3 can compare 3 files) | diff pkg1.txt pkg2.txt
grep | Search for patterns in text files and streams | 
awk | Text processing based on a dedicated query language | awk -F: '{print "name:"$1" home:"$6}' /etc/passwd
sed | Filter and substitute characters in text files, streams and file/directory names | 
sort | Sort text files entries/lines and streams in ascending or descending order | sort –u heroes
uniq | Remove duplicate entries/lines in text files (once sorted with ‘sort’) | 
paste | Combine lines from different files | paste heroes foes
join | Combine lines of files based on common fields | join part1 part2
cut | Extract column from a file | join part1 part2 | cut -d ' ' -f 1,3
split | Breaks up large files into multiple files of equal size | split /var/log/dpkg.log dpkg
tr | Translate characters in text files and streams | tr abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ < heroes > capheroes


## NANO

### INFO

COMMAND | DESCRIPTION
--- | ---
Ctrl G | Show help menu
Ctrl C | Show current line number and file information
Ctrl W | Find a word or phrase. Hit Ctrl+R to move into replace mode. Alternatively hit Ctrl+T to go to a specific line

### INPUT/OUTPUT

COMMAND | DESCRIPTION
--- | ---
Ctrl X  | Exit nano. You will be prompted to save your file if you haven't
Ctrl O  | Save a contents without exiting. Hit Ctrl+T to select an existing file
Ctrl R  | Read a text file. Hit Ctrl+T to select an existing file
Ctrl T  | When saving or reading a file, opens a browser that allows you to select a filename from a list of files and directories

### EDITING

COMMAND | DESCRIPTION
--- | ---
Ctrl K | Cut a line into the clipboard. You can press this repeatedly to cut multiple lines
Ctrl U | Uncut text. You can press this repeatedly to past multiple to past multiple time
BackSpace | Delete character currently in front of the cursor
Ctrl D | Delete character currently under the cursor
Ctrl J | Justify a paragraph of text

### NAVIGATING

COMMAND | DESCRIPTION
--- | ---
← ↑ → → | Move the cursor
Ctrl A | Move to beginning of line
Ctrl E | Move to end of line
Ctrl Y | Move down a page
Ctrl V | Move up a page
Ctrl _ | Move to a specific line
Ctrl C | Find out what line the cursor is currently on


## Vim

### EXITING

COMMAND | DESCRIPTION
--- | ---
:w | write (save) the file, but don't exit
:wq | write (save) and quit
:x | write (save) and quit
:q | quit (fails if there are unsaved changes)
:q! | quit and throw away unsaved changes
:qa | quit all buffers and windows
ZZ | write (save) current file, if modified, and quit
ZQ | quit without checking for change

### CUT & PASTE

COMMAND | DESCRIPTION
--- | ---
yy | yank (copy) a line
2yy | yank (copy) 2 lines
:n,Ny | yank lines n through N
yw | yank (copy) word
y$ | yank (copy) to end of line
p | put (paste) the clipboard after cursor
P | put (paste) before cursor
dd | delete (cut) a line
2dd | delete (cut) 2 lines
:n,Nd | delete lines n through N
dw | delete (cut) word
D | delete (cut) to the end of the line
d$ | delete (cut) to the end of the line
x | delete (cut) character

### NAVIGATING

COMMAND | DESCRIPTION
--- | ---
h | move cursor left
j | move cursor down
k | move cursor up
l | move cursor right
w | jump forwards to the start of a word
W | jump forwards to the start of a word (words can contain punctuation)
e | jump forwards to the end of a word
E | jump forwards to the end of a word (words can contain punctuation)
b | jump backwards to the start of a word
B | jump backwards to the start of a word (words can contain punctuation)
0 | jump to the start of the line
^ | jump to the first non-blank character of the line
$ | jump to the end of the line
G | go to the last line of the document
nG | go to line number n
:n | go to line number n
'' | To the position before the latest jump, / where the last "m'" / "m`" command was given.
fx | jump to next occurrence of character x
tx | jump to one character before the character x
} | jump to next paragraph
{ | jump to previous paragraph
H | jump to home (top) of screen
L | jump to last line of screen
M | jump to middle of screen
3, f, x | jump to 3rd instance of character x forward from cursor on current line.
3, F, x | jump to 3rd instance of character x back from cursor on current line.

### EDITING

COMMAND | DESCRIPTION
--- | ---
r | replace a single character
J | join line below to the current one
cc | change (replace) entire line
cw | change (replace) to the end of the word
c$ | change (replace) to the end of the line
s | delete character and substitute text
S | delete line and substitute text (same as cc)
xp | transpose two letters (delete and paste)
u | undo
Ctrl r | redo
. | repeat last command

### INSERT MODE

COMMAND | DESCRIPTION
--- | ---
i | insert before the cursor
I | insert at the beginning of the line
a | insert (append) after the cursor
A | insert (append) at the end of the line
o | append (open) a new line below the current line
O | append (open) a new line above the current line
ea | insert (append) at the end of the word
Esc | exit insert mode


## BLOCK DEVICE OPERATIONS

COMMAND | DESCRIPTION | EXEMPLE
--- | --- | ---
lsblk | Show tree view of block devices (disks, partitions, logical volumes) | 
fdisk | Menu driven tool to manage partitions and disk geometry (LBA/CHS) | fdisk -l /dev/loop0
parted | Menu driven or unattended tool to manage partitions and disk geometry | parted -s /dev/loop0 mklabel msdos ; parted -s /dev/loop0 unit MB mkpart primary ext4 1 1024
mkfs | Format partitions from disk or image (mkfs.[fstype] = mkfs -t [fstype]) | mkfs.ext4 /dev/loop0p1
mount | Attach a volume to a directory (mount point) | mount /dev/loop0p1 mntpoint
umount | Detach a volume mounted to a directory | umount mntpoint
fsck | Check filesystem consistency (‘-t’ is optional) | fsck -f -t ext4 /dev/loop0p1
df | Show disk free and occupied space per device (‘-T’ to display filesystem type, ‘-h’ for ‘human’ readability) | df -Th
du | Show disk usage per directories (‘-a’ for all, ‘-c’ for total, ‘-h’ for ‘human’ readability | du -cha mntpoint
dd | File copy/convert tool used for various block device related tasks (disk backup/copy/clone, disk wipe, disk image) | dd if=/dev/zero of=imagefile bs=1M count=1024


## LVM & RAID OPERATIONS

COMMAND | DESCRIPTION | EXEMPLE
--- | --- | ---
pvcreate | Convert a partition to a physical volume | pvcreate /dev/sdb1 /dev/sdb2 /dev/sdc1
pvdisplay | Show physical volumes | pvdisplay
pvremove | Remove a partition from physical volumes | pvremove /dev/sdc1
vgcreate | Create a volume group | vgcreate vg1 /dev/sdb1 /dev/sdb2
vgdisplay | Show volume groups | vgdisplay
vgextend | Extend a volume group with new physical volume(s) | vgextend vg1 /dev/sdc1
vgreduce | Shrink volume group | vgreduce
lvcreate | Create a logical volume from volume group | lvcreate --name lv1 --size 40G vg1
lvextend | Increase size of a logical volume* | 
lvreduce | Reduce size of a logical volume* | 
mdam | Manage RAID configuration | 


## NETWORK MANAGEMENT

COMMAND | DESCRIPTION | EXEMPLE
--- | --- | ---
hostname | Print or modify the hostname for the current session | hostname
hostnamectl | Modify the hostname persistently across reboot | hostnamectl set-hostname CoolHost
dig | Perform fwd and rev name resolution with more details than ‘host’ and ‘nslookup’ commands | dig avanade.com
ip | Tool to manage network interface configuration and routes | ip address show | grep "eth" ; ip route
netstat | Show network statistics | netstat
ss | Show network statistics with more advanced capabilities than ‘netstat’ | ss
mtr | Network ‘live’ (like top) troubleshooting tool merging ‘ping’ and ‘traceroute’ capability | mtr avanade.com


## ENVIRONMENT CONFIGURATION

COMMAND | DESCRIPTION | EXEMPLE
--- | --- | ---
env | List all current session’s environment variables (user-wide and system-wide) | env
export | Export a variable to make it persistent for the child process | export VAR='testval'
unset | Clear an environment variable | unset {http,https,ftp}_proxy
cron | Task scheduler configured with the cron table | 
crontab -e | Crontab editor (prompt to select the preferred text editor the first launch) | crontab -e
crontab -l | List existing crontab for the current user | crontab -l

### crontab entries

```
"0 5 * * 1 tar -zcf /var/backups/home.tgz /home/"
```

- Schedule based on the minute, the hour, the day of the month, the month and the day of the week : MIN HOUR DOM MON DOW
> [0-59] [0-23] [1-31] [1-12] [0-6]
- User : Only exists in the master cron table “/etc/crontab”
- Task : command to run


## PROCESS MANAGEMENT

COMMAND | DESCRIPTION | EXEMPLE
--- | --- | ---
ps | Show processes () | ps -elf ; ps -auxf
pstree | Show process tree (‘a’ to show parameter and ‘p’ to show PID) | pstree -p
killall | Equivalent to ‘kill’ command to send signals to processes such as SIGKILL to terminate a process | killall -SIGKILL dd
systemctl | Start, stop, query and configure processes managed by Systemd (‘q’ to quit) | systemctl list-units --type=service --state=running ; systemctl restart lxd-containers.service

### SYSTEMD SERVICE DEFINITION

```
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
```

## MONITORING

COMMAND | DESCRIPTION | EXEMPLE
--- | --- | ---
top | Real time display of process activities and their compute resource utilization (‘q’ to quit) | top
iotop | Real time display of process activities and their storage resource utilization (‘q’ to quit) | iotop
uptime | Show system uptime since the last boot | uptime
iostat | Shows per storage device I/O statistics (‘-k’ for stats in kilobytes and ‘-m’ for megabytes) | iostat -k


## USER MANAGEMENT

COMMAND | DESCRIPTION | EXEMPLE
--- | --- | ---
whoami | Show current user name | whoami
id | Shows user’s info UID, GID of the primary group, name and GIP of secondary group(s) | id mrcool
groups | Show user’s group membership | groups mrcool
useradd | Create a new user account (‘-m’ to force the creation of a home directory if not by default) | useradd -m mrcool
usermod | Modify user account including group membership (‘-L’ for locking the account, ‘-U’ for unlocking) | usermod -a -G cool mrcool
userdel | Delete user (‘-r’ to include deletion of its home directory) | userdel -r mrcool
passwd | Change user password | passwd mrcool
groupadd | Create a new group | groupadd cool
groupdel | Delete a group | groupdel cool