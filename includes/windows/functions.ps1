Function Install_Choco_Package($package, $params) {
    choco install --yes $package --params $params
}

Function Install_Packages {
    # First install Chocolatey
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

    # Now the applications
    Install_Choco_Package 7zip
    Install_Choco_Package awscli
    Install_Choco_Package coretemp
    Install_Choco_Package discord
    Install_Choco_Package docker-desktop
    Install_Choco_Package git "/GitOnlyOnPath /NoShellIntegration /WindowsTerminal"
    Install_Choco_Package gnupg
    Install_Choco_Package googlechrome
    Install_Choco_Package heidisql
    Install_Choco_Package microsoft-windows-terminal
    Install_Choco_Package nordvpn
    Install_Choco_Package notion
    Install_Choco_Package nvm
    Install_Choco_Package postman
    Install_Choco_Package sharex
    Install_Choco_Package spotify
    Install_Choco_Package steam
    Install_Choco_Package wsl2 --pre
    Install_Choco_Package vscode
    Install_Choco_Package zeal
}

Function Update_Packages {
    choco upgrade --yes all
}

# This updates the system gitconfig to point to GPG and SSH paths
Function Setup_Gitconfig {
    git config --system gpg.program "C:/Program Files (x86)/GnuPG/bin/gpg.exe"
    git config --system core.sshCommand "C:/Windows/System32/OpenSSH/ssh.exe"
}

Function Link_File($linkThis, $toThis) {
    New-Item -ItemType SymbolicLink -Path "$toThis" -Target "files/$linkThis"
}
