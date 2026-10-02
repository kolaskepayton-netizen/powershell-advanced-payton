Configuration PaytonBaseline
{
    Node localhost
    {
            WindowsFeature BackupFeature
    {
        Name = "Windows-Server-Backup"
        Ensure = "Present"
        }
    }
}
