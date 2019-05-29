@{

    # Script module or binary module file associated with this manifest.
    RootModule        = 'pvs.psm1'

    # Version number of this module.
    ModuleVersion     = '1.0.0'

    # ID used to uniquely identify this module
    GUID              = '74c91d30-734b-4c89-a8ae-7727ad21d1d5'

    # Author of this module
    Author            = 'Andi Rückauer'

    # Copyright statement for this module
    Copyright         = '(c) 2019 Andi Rückauer'

    # Description of the functionality provided by this module
    Description       = 'PHP version switcher for Windows'

    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion = '5.0'

    # Functions to export from this module
    FunctionsToExport = @('pvs')

    # Cmdlets to export from this module
    CmdletsToExport   = @()

    # Variables to export from this module
    VariablesToExport = @()

    # Aliases to export from this module
    AliasesToExport   = @()

    # Private data to pass to the module specified in RootModule/ModuleToProcess.
    # This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData       = @{
        PSData = @{
            # Tags applied to this module. These help with module discovery in online galleries.
            Tags         = @('php', 'version')

            # A URL to the license for this module.
            LicenseUri   = 'https://github.com/arueckauer/pvs/blob/master/LICENSE.txt'

            # A URL to the main website for this project.
            ProjectUri   = 'https://github.com/arueckauer/pvs'

            # ReleaseNotes of this module
            ReleaseNotes = 'https://github.com/arueckauer/pvs/blob/master/CHANGELOG.md'

            # OVERRIDE THIS FIELD FOR PUBLISHED RELEASES - LEAVE AT 'alpha' FOR CLONED/LOCAL REPO USAGE
            Prerelease   = 'beta2x'
        }
    }

}
