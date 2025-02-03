# Ubuntu 24.04 (Noble Numbat)

Provides a bash script for configuring a Ubuntu 24.04 (Noble Numbat) distribution.


## Software

 * ZSH (shell)
 * Git (version control)
 * Subversion (version control)
 * xclip (clipboard utility tool)
 * curl (command line HTTP request tool)
 * Meld (diff tool)
 * Kerberos (Windows authentication)
 * Maven (Java Project Management)
 * File Roller (archive manager)
 * Remmina (Remote desktop)


## Add certificate authorities

Copy certificates and install them.

```
cp my-certificates/* /usr/local/share/ca-certificates/extra/
update-ca-certificates
```


## Install manually with Ubuntu App Center

 * IntelliJ IDEA Community Edition
 * Docker
 * Visual Studio Code
 * kubectl
 * helm


## Download Java and install alternatives

Download Java installations from organization and then add them as alternatives:

```
sudo update-alternatives --install /usr/bin/java java <path-to-java>/bin/java 1
```


## Azure Data Studios

Download the `.deb` file for Linux from here:  
https://learn.microsoft.com/en-us/azure-data-studio/download-azure-data-studio

Install it with the following command:  
```shell
sudo dpkg -i azuredatastudio-linux-X.Y.Z.deb
```


## Configure Kerberos

Change default realm and add realms to `/etc/krd5.conf`:

```
[libdefaults]
	default_realm = MYDOMAIN.LOCAL

[realms]
	MYDOMAIN.LOCAL = {
		kdc = c1.mydomain.local
		kdc = c2.mydomain.local
	}
```


## Queryeer

Go to this download page and download the latest ZIP archive:  
https://github.com/kuseman/queryeer/releases

Unzip it and move it into `/opt/queryeer`.

Create the file `$HOME/.local/share/applications/queryeer.desktop` with the content:

```
[Desktop Entry]
Type=Application
Name=Queryeer
Exec=/opt/queryeer/bin/queryeer.sh
Categories=Development;IDE;SQL;
```


## Citrix workspace

Download the package "Full Package (Self-Service Support) - Citrix Workspace app for Linux (x86_64)" from here:  
https://www.citrix.com/downloads/workspace-app/linux/workspace-app-for-linux-latest.html

Install it using the following command:

```shell
$ sudo dpkg --install ./icaclient_24.11.0.85_amd64.deb
```
