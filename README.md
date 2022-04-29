# HorizonEventsQuery

The purpose of this script is to provide a quick way to search the VMware Horizon event log for
a specific user's activity and present it in a table sorted newest first.
The logged in user must have read rights to the Horizon Events database.

You must have installed the SQL Server module from PSGallery.
Find-Module -Name SQLServer | Install-Module -Name SQLServer

I want to add some enhancements like a GUI and a CSV exporter at some point when I have time.
