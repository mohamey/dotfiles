#! /bin/bash
echo "updating"
sudo apt-get update
echo "Done"

echo "Getting apt-transport-https, ca-certificates"
sudo apt-get install apt-transport-https ca-certificates
echo "Done"

echo "Adding new GPG key"
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "Done"

echo "Adding entry to docker.list"
if [ ! -f /etc/apt/sources.list.d/docker.list ]; then
    sudo touch /etc/apt/sources.list.d/docker.list
else
    sudo cp /etc/apt/sources.list.d/docker.list /etc/apt/sources.list.d/docker.list.backup
fi

echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee --append /etc/apt/sources.list.d/docker.list > /dev/null
echo "Done"

echo "Updating"
sudo apt-get update
echo "Done"

echo "Purging old repo if exists"
sudo apt-get purge lxc-docker
echo "Done"

echo "Installing recommended packages"
sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual
echo "Done"

echo "Installing Docker"
sudo apt-get install docker-engine
echo "Done"

echo "Starting Docker Daemon"
sudo service docker start
echo "Done"

echo "Running hello world"
sudo docker run hello-world
read -rsp 'Please confirm hello-world ran successfully, then press any key to continue... \n' -n1 key

echo "Adding user group"
sudo groupadd docker
echo "Done"

echo "Adding user to docker group"
sudo usermod -aG docker $USER
echo "Done"

echo "\n Please logout and log back in and run docker hello-world to ensure the usergroup was successfully created"
