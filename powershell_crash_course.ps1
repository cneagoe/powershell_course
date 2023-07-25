# intro
# similarities to .NET

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

# get the status of processes
Get-Process -Name notepad
# get the status of services
Get-Service -Name wuauserv
# get events and event logs
Get-EventLog -LogName System -Newest 10
# create a new service (don't run this)
# New-Service -Name "myservice" -BinaryFilePathName "C:\path\to\your\service.exe"

# pattern verb-noun

# splitting commands on multiple lines
Get-EventLog -LogName `
System -Newest 10

# help
Help *log*
Help *event*
# help interpret output, optional parameters, positional and mandatory
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
# -List and -LogName are mutually exclusive you’ll never use both of them at the same time, 
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

# PowerShell’s designers knew that some parameters would be used so frequently that you wouldn’t want to continually type the parameter name. 
# Those commonly used parameters are often positional, meaning that you can provide a value without typing the parameter’s name, 
# provided you put that value in the correct position.
# There are two ways to identify a positional parameter. 
# The first way is right in the syntax summary: 
# the parameter name—just the name—will be surrounded by those square brackets. 
# For example, look at the first two parameters in the second parameter set of Get-EventLog:

# [-LogName] <string> [[-InstanceId] <Int64[]>]

# The first parameter, -LogName, isn’t optional. 
# I can tell because the entire parameter—its name and its value—aren’t surrounded by square brackets. 
# The parameter name, however, is enclosed in square brackets, so that’s a positional parameter. 
# I could provide the log name without having to type -LogName. 
# Because this appears in the first position within the help file, 
# I know that the log name is the first parameter I have to provide.
# The second parameter, -InstanceId, is optional—both it and its value are enclosed in square brackets. 
# Within those, -InstanceId itself is also contained in square brackets, 
# indicating that this is also a positional parameter. 
# It appears in the second position, 
# so I would need to provide a value in the second position if I chose to omit the parameter name.
# Seccond way is to run 
# Help Get-EventLog -full
# and check the required attribute of the parameter you're interested in

# pipe 
# feeding output of one command to another command
Get-Process | Export-CSV procs.csv
Get-Process | Export-CliXML reference.xml
Dir | Out-File DirectoryList.txt
Get-Service | ConvertTo-HTML | Out-File services.html

# paranthesis 
# feeding the output of one command to the parameters of another
Diff -reference (Import-CliXML reference.xml) -difference (Get-Process) -property Name

# Just like in math, parentheses in PowerShell control the order of execution. 
# In this example, they force Import-CliXML and Get-Process to run before Diff runs. 
# The output from Import-CLI is fed to the -reference parameter, 
# and the output from Get-Process is fed to the -difference parameter.
# Actually, those parameter names are -referenceObject and -difference-Object; 
# keep in mind that you can abbreviate parameter names by typing just enough of their names 
# for the shell to be able to figure out which one you meant. 
# In this case, -reference and -difference are more than enough to uniquely identify these parameters. 
# I probably could have shortened them even further to something like -ref and -diff, 
# and the command would still have worked.


# What do all the tables mean :
# Object—This is a “table row.” It represents a single thing, like a single process or a single service.
# Property—This is a “table column.” It represents one piece of information about an object, like a process name, process ID, or service status.
# Method—This is an “action.” A method is related to a single object and makes that object do something, like killing a process or starting a service.
# Collection—This is the entire set of objects, or a “table.”

# see explicit details about the objects returned by a cmdlet
Get-Process | Get-Member

# sorting objects
Get-Process | Sort-Object -property VM
# short form
Get-Process | Sort VM,ID -desc

# select the properties you want
Get-Process | Select-Object -property Name,ID,VM,PM | Convert-ToHTML | Out-File test2.html


