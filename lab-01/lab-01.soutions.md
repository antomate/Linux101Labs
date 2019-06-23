# LAB 01

## Install and run Windows Subsystem for Linux

## Prepare SSH credentials

1. Solution

```bash
$ mkdir .ssh
$ ls -al
$ chmod 700 .ssh
$ ls -al
```

Note that the **ls** command is used with "-a" to show hidden folders and "-l" to show permissions

2. Solution

```bash
$ ssh-keygen
$ ls -l ~/.ssh
```

## Download an Azure Linux VM template

1. Solution

```bash
$ mkdir template
$ cd template
```

2. Solution

```bash
$ git clone https://github.com/antomate/Linux101Labs.git
$ find ~ -name "*.json"
```

3. Solution

```bash
$ cat Linux101Labs/lab-01/vmTemplate.parameters.json
$ less Linux101Labs/lab-01/vmTemplate.json
```

```less
/securityRules
q
```

## Edit an Azure VM template

1. Solution

```bash
$ wget 'https://api.ipify.org?format=json' -O myip
$ cat myip
$ nano Linux101Labs/lab-01/vmTemplate.json
```

```nano
[Ctrl] w
securityRules
[Alt] r
Deny
[Enter]
Allow
[Alt] r
Internet
[Enter]
<Your IP>
[Enter]
[Ctrl] o
[Enter]
[Ctrl] x
```

2. Solution

```bash
$ cat ~/.ssh/id_rsa.pub
$ vim ~/.ssh/id_rsa.pub Linux101Labs/lab-01/vmTemplate.parameters.json
```

```vim
:sp
<'select and right-click to copy'>
:bn
a
<'right-click to paste'>
[Echap]
:wq
:wq
```

## Install Azure Cli

```Bash
$ curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null
$ AZ_REPO=$(lsb_release -cs)
$ echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | sudo tee /etc/apt/sources.list.d/azure-cli.list
$ sudo apt update
$ sudo apt install azure-cli
```

## Update distribution

```Bash
$ sudo apt update
$ apt list --upgradable
$ apt upgrade
```