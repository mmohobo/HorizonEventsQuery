# The purpose of this script is to provide a quick way to search the VMware Horizon event log for
# a specific user's activity and present it in a table sorted newest first.
# The logged in user must have read rights to the Horizon Events database.

# Written by Rick Redfern, last updated 28 Apr 2022

# Username to search for is required
param(
		[Parameter(Mandatory)]
		[string]$userName
	)

# Modify these properties for your environment
[string] $Server= "MYSQLSERVER\INSTANCE"     # Your SQL Server computername and SQL instance name
[string] $Database = "HorizonEvents"         # Your VMware Horizon Events database name

# SQL Query
[string] $UserSqlQuery= "select * from dbo.event where ModuleAndEventText like '%$userName%'"

# SQLServer module must be installed to work
if (!(Get-Module -Name SqlServer)) {
    Write-Host "You must add the SQL Server Powershell module from PSGallery to run this script"
    Exit
}

# Query the database ...
$results = Invoke-SqlCmd -ServerInstance $Server -Database $Database -Query $UserSqlQuery

# ...and display the data in a table. You could optionally pipe this to a file.
$results | Sort-Object -Descending Time | Select-Object EventType, ModuleAndEventText, Time