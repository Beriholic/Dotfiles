set fhome $HOME/.config/fish
set fish_greeting ''
source $fhome/login.fish
source $fhome/enviroment.fish
source $fhome/alias.fish

starship init fish | source

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /home/beri/.lmstudio/bin
