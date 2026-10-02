# Desired State Configuration

### Configuration Name
CompanyBaseline

### Node
localhost

### Resource 1
File - AutomationFolder
This resource makes sure the C:\Automation directory exists

### Resource 2
File - Config

### Resource Purpose
This resource creates C:\Automation\config.txt and places the text NWTC Standart Configuration inside of it.
The ConfigFile depends on the AutomationFolder, so the folder is created before the file.

# PaytonBasline

### File locatin
C:\powershell-advnaced-payton\DSC\PaytonBaseline\localhost.mof

### File Purpose
The MOF contails the DSC configuration that tells the system what configuration should be applied.

### Information Observed

The MOF file targets localhost and uses the PaytonBaseline configuration. It contains a WindowsFeature resource that makes sure Windows Server Backup is installed.

# Applying the Configuration

The PaytonBaseline configuration was applied successfully using Start-DscConfiguration