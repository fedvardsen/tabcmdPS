# SYNOPSIS - Test Login - Finn Erik Edvardsen - Tableau
# V 0.1.2 - Menu Option Added - 06.07.2018 Finn Erik

# Initialize Menu
function Show-Menu
{
     param (
           [string]$Title = 'Visa Add, Remove or Delete Users'
     )
     Clear-Host
     Write-Host "================ $Title ================"

     Write-Host "1: Add New users."
     Write-Host "2: Remove Existing users."
     Write-Host "3: Delete Existing users."
     Write-Host "Q: Press 'Q' to quit."
}


$server='https://us-west-2b.online.tableau.com/#/site/fedvardsdata'
$username='fedvardsen@tableau.com'
$password='LiliLulu2016!'
#$project='Visa SA Shadow'

Set-Location "C:\Tabcmd\extras\Command Line Utility\"
start-process .\tabcmd "login -s $server -t fedvardsdata -u $username -p $password"

do
{
     Show-Menu
     $input = Read-Host "Please make a selection"
     switch ($input)
     {
           '1' {
            Clear-Host
                'Add New Users'
                start-process .\tabcmd "createsiteusers c:\scripts\input\users_test.csv"
           } '2' {
            Clear-Host
                'Remove Existing Users'
                start-process .\tabcmd "removeusers c:\scripts\input\remove_users.csv"
           } '3' {
            Clear-Host
                'Delete Existing Users'
                start-process .\tabcmd "deleteusers c:\scripts\input\delete_users.csv"
           } 'q' {
                return
           }
     }
     pause
}
until ($input -eq 'q')
# Add Users
# start-process .\tabcmd "createsiteusers c:\tabcmd\input\users_test.csv"

# Add Users to Group
# start-process .\tabcmd "addusers Development --users  c:\tabcmd\input\users_group.csv"

# Rename File after Loaded Successfully - Debug Need to ensure this run after Users are Added.
# $date = Get-Date -Format yyyyMMdd

# $root = "C:\tabcmd\"
# $Processed = Join-Path $root "Processed"
# $archive = Join-Path $root "archive\$date"

# if ((Test-Path -Path $archive)){
#     New-Item -Path $archive -ItemType Directory |
#     Out-Null
# }

# Get-ChildItem -Path $root -File |
# Move-Item -Destination $archive

# Get-ChildItem -Path $reprint -File |
# Move-Item -Destination $archive

# Remove Users
start-process .\tabcmd "deleteusers c:\scripts\input\delete_users.csv"

# Delete Users
# start-process .\tabcmd "deleteusers c:\tabcmd\input\delete_users.csv"

