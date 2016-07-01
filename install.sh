#!/bin/bash
#################
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

##### Variables
dir=~/dotfiles
olddir=~/dotfiles_old
files="vimrc zshrc zpreztorc"

# Create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
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


