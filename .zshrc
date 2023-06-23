# Zap/ install at https://github.com/zap-zsh/zap
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export EDITOR=nvim

ZSH_THEME="robbyrussell"

# Plugins 
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Zap 
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "agkozak/zsh-z"
plug "esc/conda-zsh-completion"

# Alias 
# Replacement Icons for ls 
alias ll="exa -l --icons"
alias la="exa -Ga --icons"
alias l="exa -Ga -l --icons"


## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#readable output
alias df='df -h'

#which graphical card is working
alias whichvga="/usr/local/bin/arcolinux-which-vga"

#free
alias free="free -mt"

#continue download
alias wget="wget -c"


# Aliases for software managment
# pacman or pm
alias pacman='sudo pacman --color auto'
alias yay='yay --color auto'

#ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#add new fonts
alias update-fc='sudo fc-cache -fv'

#switch between bash and zsh and zsh
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"


#Cleanup orphaned packages
alias autoremove='sudo pacman -Rns $(pacman -Qtdq)'

#clear
alias clean="clear; seq 1 $(tput cols) | sort -R | sparklines | lolcat"


# Bash, zsh, fish configs 
alias nb="$EDITOR ~/.bashrc"
alias nz="$EDITOR ~/.zshrc"

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Apps alias
alias neofetch='neofetch --source ~/.config/neofetch/logo'


alias cd..="cd .."
#ascii art
alias ascfish="asciiquarium"
alias wether='clear && wttr "Chongqing Hechuan"'
alias mycat='oneko'
alias fire='aafire -driver curses'

#v2raya
alias stv2='sudo systemctl start v2raya.service'
alias spv2='sudo systemctl stop v2raya.service'


# Neofetch 
neofetch

# neovide
alias xw='env -u WAYLAND_DISPLAY'

#cd acm
alias toac='cd ~/Berijects/C++/acm'

#docker
alias stdc="sudo systemctl start docker"
alias spdc="sudo systemctl stop docker.service docker.socket"


#nvm
source ~/.nvm/nvm.sh

#bat->cat
alias cat='bat'

#open zhsrc
alias openzsh='nvim ~/.zshrc'
#source zhsrc
alias savezsh='source ~/.zshrc'

#Duf
alias disk='duf'

#nmcli
alias wifils='nmcli device wifi'

#rainbowcat
alias rainbowcat='nyancat'

#btop
alias btp='btop'
#timeshift
alias timeshift-gui='sudo -E timeshift-gtk'

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

