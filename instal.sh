readarray -t pkglist < ./dependencies.conf

yay -S --needed  ${pkglist[*]}

