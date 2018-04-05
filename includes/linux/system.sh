function run_system_tweaks
{
    # fix 'Sparse file not found' on boot
    sudo grub-editenv create
    printf '# fix sparse file not found errors\nGRUB_SAVEDEFAULT=false\n' | sudo tee --append /etc/default/grub > /dev/null
    sudo update-grub
}
