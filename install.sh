#!/bin/bash
#################
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

##### Variables
dir=~/dotfiles
configDir=~/.config
olddir=~/dotfiles_old
oldConfigDir=~/.oldConfigs
files="vimrc zshrc zpreztorc vim"

# Create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
mkdir -p $oldConfigDir
echo "Done"

# Change to dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "Done"

# Move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
	echo "Moving any existing dotfiles from ~ to $olddir"
	mv ~/.$file $olddir/
	echo "Creating symlink to $file in home directory"
	ln -s $dir/$file ~/.$file
done

# Backup system font
echo "Backing up fonts"
#mv ~/.fonts ~/.oldFonts
echo "Creating symlink for fonts"
#ln -s $dir/fonts/ ~/.fonts
echo "Done"

# Install powerline fonts
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.fonts/ && mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts
mkdir -p ~/.config/fontconfig/conf.d/ && mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

# symlink neovim config
sudo mkdir -p ~/.config/nvim
sudo ln -s ~/dotfiles/vimrc ~/.config/nvim/init.vim
