# Install Docker on  Ubuntu 14.04
# Ref https://docs.docker.com/engine/installation/linux/ubuntulinux/
# Update your APT package index.
sudo apt-get update
# Ensure that APT works with the https method, and that CA certificates are installed.
sudo apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
# Add the new GPG key.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# Add docker.list 
sudo apt-key fingerprint 0EBFCD88
#
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# Update your APT package index.
sudo apt-get update
# Purge the old repo if it exists.
sudo apt-get -y install docker-ce docker-ce-cli containerd.io
# Verify that APT is pulling from the right repository.
