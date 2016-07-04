packages="i3 i3blocks vim compton rofi feh python2.7 git python-pip"

# Install apt-get dependencies
for pack in $packages; do
    echo "Installing $pack"
    sudo apt-get install $pack -y
    echo "Done"
done

