Configuration PaytonBaseline
{
    Node localhost
    {
            WindowsFeature BackupFeature
        {
        Name = "Windows-Server-Backup"
        Ensure = "Present"
        }
    
        File BaselineFile
        {
            DestinationPath = "C:\Baseline\Baseline.txt"
            Contents = "Payton DSC Baseline"
            Type = "File"
            Ensure = "Present"
        }
    }
}

