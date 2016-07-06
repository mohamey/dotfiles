#!/bin/bash
#################
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

##### Variables
dir=~/dotfiles
dotfilesConfig=~/dotfiles/config-stuff
configDir=~/.config
olddir=~/dotfiles_old
oldConfigDir=~/.oldConfigs
files="vimrc zshrc zpreztorc vim"
configFiles="gtk-2.0 gtk-3.0 i3 i3blocks.conf"

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

echo "Changing to $configDir"
cd $configDir
echo "Done"

# Make .config symlinks
for file in $configFiles; do
    echo "Moving existing config files to $oldConfigDir"
    mv $file $oldConfigDir/$file
    echo "Creating symlink to $file in .config dir"
    ln -s $dotfilesConfig/$file $file
done

# Backup system font
echo "Backing up fonts"
mv ~/.fonts ~/.oldFonts
echo "Creating symlink for fonts"
ln -s $dir/fonts/ ~/.fonts
echo "Done"

# Add GPM Script for now playing in i3Blocks
echo "Backing up existing script"
mkdir -p ~/Documents/oldi3Blocks
mv ~/Documents/i3blocks/ ~/Documents/oldi3Blocks/
echo "Creating directory ~/Documents/i3blocks for GPM script"
mkdir -p ~/Documents/i3blocks
echo "Adding Script to directory"
ln -s $dir/playing.py ~/Documents/i3blocks/
echo "Done"

# Move improved battery script
sudo rm -rf /usr/share/i3blocks/battery
ln -s $dir/battery /usr/share/i3blocks/

# Add Wallpaper
mkdir -p ~/Pictures/Wallpaper
cp $dir/wallpaper ~/Pictures/Wallpapers/ksp.jpeg

# Install powerline fonts
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.fonts/ && mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts
mkdir -p ~/.config/fontconfig/conf.d/ && mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

