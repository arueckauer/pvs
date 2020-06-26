<#
  .Synopsis
  PHP version switcher for Windows

  .Description
  This function switches to a specified PHP version in an environment where
  multiple PHP versions are installed as Apache Modules.

  .Parameter version
  The PHP version to switch to.

  .Example
  pvs 7.4
#>

#Requires -RunAsAdministrator

# @todo Add configuration file with
# - PHP versions
# - Apache path
# - Smylink path & name
# - Directory(/ies) containing log files
# @todo Parameter to just restart Apache
# @todo Parameter to delete log files
function pvs {
    [CmdletBinding()]

    # Fetch version to switch to
    Param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)] [Alias("v")] [String]$version
    )

    switch ($version) {
        "7.0" { $phpPath = "C:\webserv\php-7.0.33-Win32-VC14-x64" }
        "7.1" { $phpPath = "C:\webserv\php-7.1.33-Win32-VC14-x64" }
        "7.2" { $phpPath = "C:\webserv\php-7.2.31-Win32-VC15-x64" }
        "7.3" { $phpPath = "C:\webserv\php-7.3.19-Win32-VC15-x64" }
        "7.4" { $phpPath = "C:\webserv\php-7.4.7-Win32-vc15-x64" }
        Default { throw "Provided PHP version $version is not supported" }
    }

    Write-Host "PHP Version Switcher 1.0.0 by Andi Rückauer" -ForegroundColor Blue
    Write-Host ""
    Write-Host "Switching to version: $version..." -ForegroundColor DarkCyan
    Write-Host ""

    # Remove SymbolicLink
    # @todo Only delete, if it does exist
    Write-Host "Removing SymbolicLink..." -ForegroundColor DarkCyan
    Write-Host ""
    (Get-Item C:\webserv\php\).Delete()

    # Create new symlink
    Write-Host "Creating SymbolicLink..." -ForegroundColor DarkCyan
    Write-Host ""
    New-Item -ItemType SymbolicLink -Path C:\webserv\ -Name php -Value $phpPath

    # Restart Apache
    # @todo If log files are to be deleted: Stop Apache service, delete log files, start Apache service
    Write-Host "Restarting Apache..." -ForegroundColor DarkCyan
    Write-Host ""
    Restart-Service Apache2.4
}

Export-ModuleMember -Function pvs
