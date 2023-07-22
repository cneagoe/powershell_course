# Managing files and folders
# Get-ChildItem (for Dir, Ls)
Get-ChildItem -Path C:\
# New-Item (for MkDi)
New-Item -Path C:\ -Name "Source" -ItemType "directory"
New-Item -Path C:\ -Name "Destination" -ItemType "directory"
New-Item -Path C:\Source -Name "file.txt" -ItemType "file"
# Move-Item (for Move)
Move-Item -Path C:\Source\file.txt -Destination C:\Destination
# Set-Location (for Cd)
Set-Location -Path C:\Destination
# Rename-Item (for Ren)
Rename-Item -Path file.txt -NewName newname.txt
# Get-Content (for Typ Cat)
Get-Content -Path newname.txt
# Copy-Item (for Copy, Cp)
Copy-Item -Path C:\Destination\file.txt -Destination C:\Source
# Remove-Item (for Del, Rm, RmDir)
Remove-Item -Path C:\Source\file.txt
# pattern verb-noun
# help pages

# get the status of processes
Get-Process -Name notepad
# get the status of services
Get-Service -Name wuauserv
# get events and event logs
Get-EventLog -LogName System -Newest 10
# create a new service (don't run this)
New-Service -Name "myservice" -BinaryFilePathName "C:\path\to\your\service.exe"
