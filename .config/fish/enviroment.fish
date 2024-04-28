set -x PATH $HOME/.local/bin $PATH
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH $HOME/.cargo/env $PATH
set -x PATH $HOME/go/bin $PATH
set -x PATH $HOME/.nvm $PATH
set -x PATH $HOME/.npm-global/bin $PATH
set -x EDITOR nvim
# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

set --export PATH $HOME/.android $PATH
