#!/bin/bash

####################################################################################################################################################################################
#All available containers images are hosted on https://jenkins.linuxcontainers.org/view/Images/
#Kali Linux image https://jenkins.linuxcontainers.org/view/Images/job/image-kali/architecture=amd64,release=current,variant=default/lastSuccessfulBuild/artifact/rootfs.tar.xz
#Note: Use "Default" and "rootfs.tar.xz" 
####################################################################################################################################################################################

#Install basic packages and dependencies with ROOT access
apt install wget curl nano git nano inetutils-tools iputils-ping kali-defaults zsh zsh-syntax-highlighting zsh-autosuggestions python3 python3-pip glances unzip openssh-server -y

#Create user
adduser kali
usermod -aG sudo kali

#Update & Upgrade 
sudo apt update && sudo apt upgrade && sudo apt upgrade && sudo apt dist-upgrade

#Install desktop enviroment *** gnome-browser-connector ***
# Note: https://www.kali.org/docs/general-use/metapackages/
sudo apt install -y kali-desktop-xfce xorg xrdp firefox-esr

#IMPORTANT Before rebooting, uninstall network-manager package to avoid conflict
sudo apt purge network-manager
sudo reboot

#Enable and Start both SSH and xrdp services
sudo systemctl enable ssh && sudo systemctl enable xrdp
sudo systemctl start ssh && sudo systemctl start xrdp

#Install Kali Linux EVERY THING!
sudo apt install kali-linux-everything

