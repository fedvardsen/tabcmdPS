# SYNOPSIS - Test Login - Finn Erik Edvardsen - Tableau 
# V 0.1.1

$server='https://us-west-2b.online.tableau.com/#/site/fedvardsdata'
$username='fedvardsen@tableau.com'
$password='LiliLulu2016!'
$project='Visa SA Shadow'

Set-Location "C:\Tabcmd\extras\Command Line Utility\"
start-process .\tabcmd "login -s $server -t fedvardsdata -u $username -p $password"

# Add Users
# start-process .\tabcmd "createsiteusers c:\tabcmd\input\users_test.csv"

# Add Users to Group
start-process .\tabcmd "addusers Development --users  c:\tabcmd\input\users_group.csv"

# Rename File after Loaded Successfully - Debug Need to ensure this run after Users are Added.
$date = Get-Date -Format yyyyMMdd

$root = "C:\tabcmd\"
$Processed = Join-Path $root "Processed"
$archive = Join-Path $root "archive\$date"

if ((Test-Path -Path $archive)){
    New-Item -Path $archive -ItemType Directory |
    Out-Null
}

Get-ChildItem -Path $root -File |
Move-Item -Destination $archive

Get-ChildItem -Path $reprint -File |
Move-Item -Destination $archive

# Remove Users
# start-process .\tabcmd "removeusers c:\tabcmd\input\remove_users.csv"

# Delete Users
# start-process .\tabcmd "deleteusers c:\tabcmd\input\delete_users.csv"

