#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
autoload -Uz promptinit
promptinit
prompt cloud

#Change default editor
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

#Autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export NVM_DIR="/home/yasir/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-solarized-dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# ZSH Powerline Fonts
if [[ -r ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
fi

