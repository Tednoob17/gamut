#!/bin/bash

ln -sf /usr/share/zoneinfo/Africa/Porto-Novo /etc/localtime 
hwclock --systohc --utc
echo -e "\e[33;1mRemove the \"#\" of the \"en_US.UTF-8\" line\e[0m"
sleep 10
emacs /etc/locale.gen
locale-gen
echo "KEYMAP=fr" > /etc/vconsole.conf
export KEYMAP=fr
echo "Archlinux" > /etc/hostname
mkinitcpio -P
echo -e "\e[33;1mWrite \"root\"\e[0m"
passwd
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
sudo groupadd asso
sudo groupadd managers
sudo groupadd epitech
sudo useradd -m -G asso,Hogwarts -s /bin/bash turban
sudo useradd -m -G managers,Hogwarts -s /bin/bash dumbledore
echo -e "\e[33;1mWrite \"turban\"\e[0m"
sudo passwd leslie
echo -e "\e[33;1mWrite \"dumbledore\"\e[0m"
sudo passwd romain
#echo -e "\e[33;1mAdd under the line \"root ALL=(ALL:ALL) ALL\" this \"dumbledore ALL=(ALL:ALL) NOPASSWD: ALL\"\e[0m"
sleep 10
EDITOR=emacs visudo
NetworkManager
systemctl enable NetworkManager
systemctl enable lightdm
echo -e "\e[34;1mPlease take a snapshot\e[0m"
echo -e "\e[34;1mSettings finished\e[0m"
echo -e "\e[34;1mPlease execute \"exit\", then \"umount -R /mnt\" and then \"shutdown now\"\e[0m"
echo -e "\e[34;1mPlease read the README to find out more\e[0m"
