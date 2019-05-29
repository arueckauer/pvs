<#
  .Synopsis
  PHP version switcher for Windows

  .Description
  This function switches to a specified PHP version in an environment where
  multiple PHP versions are installed as Apache Modules.

  .Parameter version
  The PHP version to switch to.

  .Example
  pvs 7.3
#>

function pvs {
    [CmdletBinding()]

    Param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)] [Alias("v")] [String]$version
    )

    Write-Host "PHP Version Switcher 1.0.0 by Andi Rückauer" -ForegroundColor Blue
    Write-Host ""
    Write-Host "Switching to version: $version..." -ForegroundColor DarkCyan
    Write-Host ""
}

Export-ModuleMember -Function pvs
