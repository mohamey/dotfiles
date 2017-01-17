packages="i3 i3blocks vim compton rofi feh arc-theme zsh thunar lxappearance moka-icon-theme python2.7 git python-pip tlp tlp-rdw playerctl emacs neovim"
repos="ppa:moka/daily ppa:linrunner/tlp"

# Arc Dark theme setup
wget http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key
sudo apt-key add - < Release.key
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' >> /etc/apt/sources.list.d/arc-theme.list"

# Add Repositories
for repo in $repos; do
    echo "Adding repo $repo"
    sudo add-apt-repository $repo
    echo "Done"
done

# Update package list
sudo apt-get update

# Install apt-get dependencies
for pack in $packages; do
    echo "Installing $pack"
    sudo apt-get install $pack -y
    echo "Done"
done

# Change shell to ZSH
chsh -s /bin/zsh

# Get ZSH Autosuggestions
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# Install Base-16 shell
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# Install zprezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
git pull && git submodule update --init --recursive

# Remove Nautilus
sudo apt-get remove nautilus
