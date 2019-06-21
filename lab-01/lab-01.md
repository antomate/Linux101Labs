# LAB 01

This lab focus on setting up a Linux environement on top of Windows using *Windows Subsystem for Linux* and executing Linux basic commands within that environment.

More information about WSL here : https://blogs.msdn.microsoft.com/wsl/2016/06/15/wsl-file-system-support/

## Install and run Windows Subsystem for Linux

*Windows Subsystem for Linux (WSL)* provides a Linux environement on your Windows computer and can be installed using the following PowerShell cmdlets :

0. Open a PowerShell session as administrator

1. Enable WSL Windows feature (will require reboot)
```PowerShell
> Enable-WindowsOptionalFeature -Online -FeatureName "Microsoft-Windows-Subsystem-Linux"
```

2. After reboot, Open a PowerShell session as administrator and install Ubuntu 18.04 Linux distribution
```PowerShell
> New-Item -path "c:\" -name "distro" -ItemType "directory"
> Set-Location C:\distro\
> Invoke-WebRequest -Uri "https://aka.ms/wsl-ubuntu-1804" -OutFile "Ubuntu.appx" -UseBasicParsing
> Rename-Item "Ubuntu.appx" "Ubuntu.zip"
> Expand-Archive "Ubuntu.zip"
> Remove-Item "Ubuntu.zip"
> $userenv = [System.Environment]::GetEnvironmentVariable("Path", "User")
> [System.Environment]::SetEnvironmentVariable("PATH", $userenv + ";C:\distro\Ubuntu", "User")
```

3. Instantiate and run Ubuntu
```bash
> ubuntu1804.exe
```

This will instantiate Ubuntu (can take a few minutes), you will be prompted to create a user name and password. From there you will be presented a **bash** prompt. The Linux distribution can either be started from **CMD** or **PowerSHell** or be launching the exe from explorer which will start a dedicated window.

## Prepare SSH credentials

1. Create the ".ssh" directory, verify its default permissions and change them (this step is only for lab purpose as the .ssh dir is created by ssh-keygen if it does not exist)

```bash
$ mkdir .ssh
$ ls -al
$ chmod 700 .ssh
$ ls -al
```

Note that the **ls** command is used with "-a" to show hidden folders and "-l" to show permissions

2. Generate a SSH key pair with the default value for the path and no password (since you're Linux environment is not shared). List the content of the ~/.ssh directory and verify the permissions on the key files.

```bash
$ ssh-keygen
$ ls -l ~/.ssh
```

## Download an Azure Linux VM template

1. Create a target directory for the template and change to that directory

```bash
$ mkdir template
$ cd template
```

2. Clone a repo with Azure Linux VM template, display the template with less and search for occurence of "Deny"

```bash
$ git clone https://github.com/antomate/Linux101Labs.git
$ find ~ -name "*.json"
$ cat Linux101Labs/lab-01/vmTemplate.parameters.json
$ less Linux101Labs/lab-01/vmTemplate.json
/Deny
q
```

## Edit an Azure VM template

Edit an Azure VM template to enable inbound TCP22 ("Allow" instead of "Deny") for your public IP address and add your SSH public key

```bash
$ cat ~/.ssh/id_rsa.pub
$ nano Linux101Labs/lab-01/vmTemplate.parameters.json
$ nano Linux101Labs/lab-01/vmTemplate.json
```

## Install Azure Cli

1. Install pre-requisites to Azure Cli, including

The installation consist of adding the Microsoft *GPG* signing key to the trusted ones and add the *Azure Cli* distribution specific repository url to the list of available repository for *apt*.

```Bash
$ curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null
$ AZ_REPO=$(lsb_release -cs)
$ echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | sudo tee /etc/apt/sources.list.d/azure-cli.list
$ sudo apt update
$ sudo apt install azure-cli
```

## Update distribution

Elevate using "sudo" to update package list. See the list of packages availabale for upgrade and upgrade them all.
```Bash
$ sudo apt update
$ apt list --upgradable
$ apt upgrade
```