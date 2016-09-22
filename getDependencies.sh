packages="zsh python3-pip neovim"

# Add neovim repo
sudo add-apt-repository ppa:neovim-ppa/unstable

sudo apt-get update

# Install apt-get dependencies
for pack in $packages; do
    echo "Installing $pack"
    sudo apt-get install $pack -y
    echo "Done"
done

# Install neovim plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

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
