@{
    # Script module or binary module file associated with this manifest.
    RootModule = 'att.dataimport.psm1'

    # Version number of this module.
    ModuleVersion = '1.1.0'

    # ID used to uniquely identify this module
    GUID = '7c3b3167-a8c0-45bd-807b-791be6445b43'

    # Description of the functionality provided by this module
    Description = 'Module to download and import att dat files into Azure SQL'

    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion = '7.2'

    # Assemblies that must be loaded prior to importing this module
    RequiredAssemblies = @( 'bin\Microsoft.Identity.Client.dll' )

    # Modules that must be imported into the global environment prior to importing this module
    RequiredModules = @{ModuleName="PSFramework"; ModuleVersion="1.8.291" }
    
    # Functions to export from this module
    FunctionsToExport = 'Connect-Service',
                        'Disconnect-Service',
                        'New-DatabaseConnection',
                        'Update-DatabaseSchema',
                        'Start-LogFileLogger',
                        'Stop-LogFileLogger',
                        'Import-JobChangeDatData',
                        'Import-MergerXrefDatData',
                        'Import-OSuitsDatData',
                        'Import-SuitsDatData'

    DefaultCommandPrefix = "DataImport" 
}
