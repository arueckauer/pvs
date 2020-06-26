# PHP version switcher for Windows (PowerShell Module)

This project offers version switching functionality of locally installed PHP
versions as a PowerShell module.

It assumes PHP is used as an Apache module and restarts the Apache service
after a version switch. This process can easily be adjusted, if PHP-FPM or any
another setup is used.

## Installation

The following instructions describe the installation of the module for the
current user.

### Download and move module to modules path

Download the latest [release](https://github.com/arueckauer/pvs/releases) and
extract it to a temporary directory. To use the latest version, clone the
repository instead.

Create a path for the module. If applicable replace `1.0.0` with the actual
downloaded version.

```powershell
New-Item -Type Directory -Path $HOME\Documents\WindowsPowerShell\Modules\pvs\1.0.0
```

Copy `src\pvs.psd1` and `src\pvs.psm1` module to its new home.

```powershell
Copy-Item C:\path\to\pvs\pvs.* -Destination $HOME\Documents\WindowsPowerShell\Modules\pvs\1.0.0\
```

### Import module

The restart of the Apache service, requires elevated rights. That is why this
module will only be imported in elevated PowerShell sessions. Loading and
executing the pvs in a non-elevated PowerShell will fail the to restart the
Apache service.

Add the following lines to the `profile.ps1`. To learn more about the
PowerShell profiles and their locations, read [about_profiles](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7).

```powershell
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if ($currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Import-Module pvs
}
```

## Configuration

The pvs comes with a configuration, which assumes various PHP versions are
installed in `C:\webserv`. You can adjust this configuration to your needs.

For the "active" version a symlink is set to `C:\webserv`. This path is set in
the PATH environment variable and the Apache configuration is referencing the
symlink instead of the actual path.

`httpd.conf`

```
# Load PHP7 Module
AddHandler application/x-httpd-php .php
AddType application/x-httpd-php .php .html
LoadModule php7_module "C:/webserv/php/php7apache2_4.dll"
PHPIniDir "C:/webserv/php"
```

In `src\pvs.psm1` you can configure the available versions and their paths. For
example:

```powershell
switch ($version) {
    "7.0" { $phpPath = "C:\webserv\php-7.0.33-Win32-VC14-x64" }
    "7.1" { $phpPath = "C:\webserv\php-7.1.33-Win32-VC14-x64" }
    "7.2" { $phpPath = "C:\webserv\php-7.2.31-Win32-VC15-x64" }
    "7.3" { $phpPath = "C:\webserv\php-7.3.19-Win32-VC15-x64" }
    "7.4" { $phpPath = "C:\webserv\php-7.4.7-Win32-vc15-x64" }
    Default { throw "Provided PHP version $version is not supported" }
}
```

This configuration shows a setup of all the latest PHP 7 minor versions. It is
possible to have multiple patch version of the same minor installed by
providing the full version number, e.g. `7.4.6`.

## Usage

Open an elevated PowerShell, invoke `pvs` and provide the version as parameter.

```powershell
C:\source> pvs 7.4
PHP Version Switcher 1.0.0 by Andi Rückauer

Switching to version: 7.4...

Removing SymbolicLink...

Creating SymbolicLink...



    Verzeichnis: C:\webserv


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d----l        26.06.2020     09:15                php
Restarting Apache...

WARNUNG: Warten auf Beendigung des Diensts "Apache2.4 (Apache2.4)"...


C:\source> php -v
PHP 7.4.7 (cli) (built: Jun  9 2020 13:36:15) ( ZTS Visual C++ 2017 x64 )
Copyright (c) The PHP Group
Zend Engine v3.4.0, Copyright (c) Zend Technologies
    with Xdebug v2.9.0, Copyright (c) 2002-2019, by Derick Rethans
```
