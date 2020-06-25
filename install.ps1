#Requires -RunAsAdministrator
. $PSScriptRoot\includes\windows\main.ps1

Write-Host "Setting up system"
Setup_System

Write-Host "Updating system"
Update_System

Write-Host "Installing Dotfiles"
Install_Dotfiles

Write-Host "Success! Press any key to exit..."
$x = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
