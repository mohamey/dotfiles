packages="i3 i3blocks vim compton rofi feh arc-theme zsh thunar lxappearance moka-icon-theme python2.7 git python-pip python3-pip neovim"

# Arc Dark theme setup
wget http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key
sudo apt-key add - < Release.key
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' >> /etc/apt/sources.list.d/arc-theme.list"

# Moka icon theme
sudo add-apt-repository ppa:moka/daily

# Add neovim repo
sudo add-apt-repository ppa:neovim-ppa/unstable

sudo apt-get update

# Install apt-get dependencies
for pack in $packages; do
    echo "Installing $pack"
    sudo apt-get install $pack -y
    echo "Done"
done

# Install python for neovim
echo "Pip3 installing neovim"
pip3 install neovim
echo "Done"

# Change shell to ZSH
sudo chsh -s /bin/zsh

# Get ZSH Autosuggestions
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# Install Base-16 shell
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# Install zprezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
git pull && git submodule update --init --recursive

# Remove Nautilus
sudo apt-get remove nautilus
