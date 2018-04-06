function fix_grub_bootloader
{
    # fix 'Sparse file not found' on boot
    sudo grub-editenv create
    printf '# fix sparse file not found errors\nGRUB_SAVEDEFAULT=false\n' | sudo tee --append /etc/default/grub > /dev/null
    sudo update-grub
}

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
