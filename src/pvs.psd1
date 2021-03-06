@{

    # Die diesem Manifest zugeordnete Skript- oder Binärmoduldatei.
    RootModule        = 'pvs.psm1'

    # Die Versionsnummer dieses Moduls
    ModuleVersion     = '1.1.0'

    # ID zur eindeutigen Kennzeichnung dieses Moduls
    GUID              = '69305790-69cd-4ffe-af1c-f7ec6e486d13'

    # Autor dieses Moduls
    Author            = 'Andi Rückauer'

    # Unternehmen oder Hersteller dieses Moduls
    CompanyName       = 'Unbekannt'

    # Urheberrechtserklärung für dieses Modul
    Copyright         = '(c) 2019 Andi Rückauer. Alle Rechte vorbehalten.'

    # Beschreibung der von diesem Modul bereitgestellten Funktionen
    Description       = 'Switching PHP versions on Windows made easy'

    # Die für dieses Modul mindestens erforderliche Version des Windows PowerShell-Moduls
    PowerShellVersion = '5.0'

    # Aus diesem Modul zu exportierende Funktionen. Um optimale Leistung zu erzielen, verwenden Sie keine Platzhalter und löschen den Eintrag nicht. Verwenden Sie ein leeres Array, wenn keine zu exportierenden Funktionen vorhanden sind.
    FunctionsToExport = @('pvs')

    # Aus diesem Modul zu exportierende Cmdlets. Um optimale Leistung zu erzielen, verwenden Sie keine Platzhalter und löschen den Eintrag nicht. Verwenden Sie ein leeres Array, wenn keine zu exportierenden Cmdlets vorhanden sind.
    CmdletsToExport   = @()

    # Die aus diesem Modul zu exportierenden Variablen
    VariablesToExport = '*'

    # Aus diesem Modul zu exportierende Aliase. Um optimale Leistung zu erzielen, verwenden Sie keine Platzhalter und löschen den Eintrag nicht. Verwenden Sie ein leeres Array, wenn keine zu exportierenden Aliase vorhanden sind.
    AliasesToExport   = @()

    # Die privaten Daten, die an das in "RootModule/ModuleToProcess" angegebene Modul übergeben werden sollen. Diese können auch eine PSData-Hashtabelle mit zusätzlichen von PowerShell verwendeten Modulmetadaten enthalten.
    PrivateData       = @{

        PSData = @{

            # 'Tags' wurde auf das Modul angewendet und unterstützt die Modulermittlung in Onlinekatalogen.
            Tags         = @('php', 'version')

            # Eine URL zur Lizenz für dieses Modul.
            LicenseUri   = 'https://github.com/arueckauer/pvs/blob/master/LICENSE.txt'

            # Eine URL zur Hauptwebsite für dieses Projekt.
            ProjectUri   = 'https://github.com/arueckauer/pvs'

            # Eine URL zu einem Symbol, das das Modul darstellt.
            # IconUri = ''

            # 'ReleaseNotes' des Moduls
            ReleaseNotes = 'https://github.com/arueckauer/pvs/blob/master/CHANGELOG.md'

        }

    }

}
