lsmod | grep kvm #intel or amd
sudo rmmod kvm_intel
echo "blacklist kvm_intel" | sudo tee -a /etc/modprobe.d/blacklist.conf


sudo apt update && sudo apt upgrade -y
sudo apt install -y vim tar bzip2 git virtualbox curl gnupg software-properties-common
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vagrant
