. $PSScriptRoot\functions.ps1

Function Setup_System {
    # Install_Packages
}

Function Update_System {
    # Update_Packages
}

Function Install_Dotfiles {
    # Setup_Gitconfig
    Link_File windows/CoreTemp.ini "C:\ProgramData\chocolatey\lib\coretemp\tools\CoreTemp.ini"
}

