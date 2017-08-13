sudo pt-get install \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual

sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

sudo apt-get install -y docker-ce
#Get good entropy
sudo apt-get install -y rng-tools


#docker-compose over ansible
sudo apt-get install -y python-pip
sudo pip install docker-py

#docker-compose
curl -L https://github.com/docker/compose/releases/download/1.14.0/docker-compose-`uname -s`-`uname -m` > /tmp/docker-compose
chmod +x /tmp/docker-compose
sudo mv /tmp/docker-compose /usr/local/bin/docker-compose
