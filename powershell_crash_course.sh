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

# get the status of processes
Get-Process -Name notepad
# get the status of services
Get-Service -Name wuauserv
# get events and event logs
Get-EventLog -LogName System -Newest 10
# create a new service (don't run this)
New-Service -Name "myservice" -BinaryFilePathName "C:\path\to\your\service.exe"

# help
Help *log*
Help *event*
# help interpret output
# Most commands can work in a variety of different ways, depending on what you need
# them to do. For example, here’s the syntax section for the 
# Get-EventLog help:

# SYNTAX
# Get-EventLog [-AsString] [-ComputerName <string[]>] [-List] [<CommonParameters>]
# Get-EventLog [-LogName] <string> [[-InstanceId] <Int64[]>] 
# [-After <DateTime>] [-AsBaseObject] [-Before <DateTime>] [-ComputerName <string[]>] 
# [-EntryType <string[]>] [-Index <Int32[]>] [-Message <string>] 
# [-Newest <int>] [-Source <string[]>] [-UserName <strin g[]>] [<CommonParameters>]

# The command name is listed twice. That indicates that the command supports two parameter sets, 
# there are two distinct ways in which you can use this command.
# Some of the parameters will be shared between the two sets. 
# Both parameter sets include a -ComputerName parameter. 
# The two parameter sets will always have at least one unique parameter that exists only in that parameter set. 
# In this case, the first set supports -AsString and -List, neither of which are included in the second set; 
# the second set contains numerous parameters that aren’t included in the first.
# If you use a parameter that’s only included in one set,
# you’re locked into that set and can only use additional parameters that appear within that same set. 
# If I choose to use -List, then the only other parameters I can use are -AsString and -ComputerName, 
# because those are the only other parameters included in the parameter set where -List lives. 
# I couldn’t add in the -LogName parameter, because it doesn’t live in the first parameter set. 
# That means -List and -LogName are mutually exclusive—you’ll never use both of them at the same time, 
# because they live in different parameter sets.
# Sometimes it’s possible to run a command with only parameters that are shared between multiple sets. 
# In those cases, the shell will usually select the first-listed parameter set. 
# Because each parameter set implies different behavior, it’s important to understand which parameter set you’re running.
# You’ll notice that every parameter set for every PowerShell cmdlet ends with [<CommonParameters>]. 
# This refers to a set of eight parameters that are available on every single cmdlet, no matter how you’re using that cmdlet. 
# (see link in readme about common parameters)
# Help lists optional parameters in square brackets. 
# For example, [-ComputerName<string[]>] indicates that the entire -ComputerName parameter is optional. 
# You don’t have to use it at all, the cmdlet will probably default to the local computer if you don’t specify an alternative. 
# That’s also why [<Common-Parameters>] is in square brackets—you can run the command without using any of the common parameters.
# Almost every cmdlet has at least one optional parameter. 
