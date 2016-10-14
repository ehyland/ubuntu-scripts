#!/bin/sh

# create swap
fallocate -l 2G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
sysctl vm.swappiness=20
sysctl vm.vfs_cache_pressure=50


# make permanent
echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab
echo 'vm.swappiness=20' | tee -a /etc/sysctl.conf
echo 'vm.vfs_cache_pressure=50' | tee -a /etc/sysctl.conf
