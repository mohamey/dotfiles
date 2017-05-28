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

alias install="sudo apt-get install"
alias remove="sudo apt-get remove"
alias purge="sudo apt-get purge"
alias update="sudo apt-get update"
alias add="sudo add-apt-repository"
# alias vim="nvim"
alias yesod-docker-dev="stack --docker-run-args='--net=bridge --publish=3000:3000' exec -- yesod devel"
alias netsoc-proxy="ssh -D 9000 -C -f -q -N ore0@netsoc.tcd.ie"
alias spacemacs="emacs . > /dev/null &"
alias yurt="yaourt --noconfirm"
