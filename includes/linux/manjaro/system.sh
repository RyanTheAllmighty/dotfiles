# remove unecessary files (such as from removed packages)
function cleanup_unused_files
{
    rm -f ~/Readme
    rm -rf ~/Public
    rm -rf ~/.cache/evolution
    rm -rf ~/.cache/lollypop
    rm -rf ~/.cache/mozilla
    rm -rf ~/.cache/ms-office-online
    rm -rf ~/.config/evolution
    rm -rf ~/.config/hexchat
    rm -f ~/.config/manjaro-hello.json
    rm -rf ~/.hplip
    rm -rf ~/.jak
    rm -rf ~/.mozilla
}

# this will configure things to make sure that the bluetooth headsets will work properly
function configure_bluetooth_headset
{
    install_pacman_package pulseaudio-alsa pulseaudio-bluetooth bluez bluez-libs bluez-utils pavucontrol-qt

    sudo sh -c "printf \"\n# automatically switch to newly-connected devices\nload-module module-switch-on-connect\n\" >> /etc/pulse/default.pa"
    sudo sh -c "printf \"\n# load bluez5\nload-module module-bluez5-device\nload-module module-bluez5-discover\n\" >> /etc/pulse/system.pa"

    sudo sed -i 's|#AutoEnable=false|AutoEnable=true|g' /etc/bluetooth/main.conf
}

function disable_unused_services
{
    # yeah don't need search, a npm install will lock my system for 10+ minutes
    balooctl stop
    balooctl disable
}
