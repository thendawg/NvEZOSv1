#!/bin/bash

# Make sure git is installed
apt-get -y install git

# Setup nVidia Drivers
mkdir /nvidia/
cd /nvidia/
wget http://us.download.nvidia.com/XFree86/Linux-x86_64/384.59/NVIDIA-Linux-x86_64-384.59.run
chmod +x NVIDIA-Linux-x86_64-384.59.run
sh ./NVIDIA-Linux-x86_64-384.59.run

# Setup CUDA 8
mkdir /cuda/
cd /cuda/
wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run
chmod +x cuda_8.0.61_375.26_linux-run
sh ./cuda_8.0.61_375.26_linux-run

# Install Apache/PHP
apt-get -y install apache2
apt-get -y install libapache2-mod-php
systemctl restart apache2

# Setup ethminer
apt-get -y install software-properties-common
add-apt-repository -y ppa:ethereum/ethereum
apt-get -y update
apt-get -y install cmake libcryptopp-dev libleveldb-dev libjsoncpp-dev libjsonrpccpp-dev libboost-all-dev libgmp-dev libreadline-dev libcurl4-gnutls-dev ocl-icd-libopencl1 opencl-headers mesa-common-dev libmicrohttpd-dev build-essential
mkdir /ethminer/
cd /ethminer/
git clone "https://github.com/davilizh/cpp-ethereum.git"
cd cpp-ethereum
git checkout optimized_for_some_nvidian_cards
mkdir build
cd build
cmake -DBUNDLE=cudaminer ..
make -j8
chown -R www-data /ethminer/
chmod -R 755 /ethminer/

# Extract EWBF
mkdir /ewbf/
mv /nvezos/installpayload/miners/ewbf/* /ewbf/
chown -R www-data /ewbf/
chmod -R 755 /ewbf/

# Extract Claymore
mkdir /claymore/
mv /nvezos/installpayload/miners/claymore/* /claymore/
chown -R www-data /claymore/
chmod -R 755 /claymore/

# Cleanup
rm -rf /cuda/
rm -rf /nvidia/

# Setup Service
/bin/cp -f /nvezos/scripts/system/runonce.service /etc/systemd/system/
chmod 755 /etc/systemd/system/runonce.service
chmod 755 /nvezos/scripts/system/runonce.sh
systemctl daemon-reload

# Install is complete
echo "Installation of NvEZOS image prebuild is now complete"

# Things to do manually after reboot - delete xorg.conf, enable runone.service

