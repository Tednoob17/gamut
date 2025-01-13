#!/bin/bash

echo -e "\e[34;1mArchlinux installation Running...\e[0m"
echo "The 15G size who is in pdf project is a mistake for me because 15 Go (root) + 5 Go (home) + 400 Mo (boot) + 500 Mo (swap) exceeds the available 15 Go primary partition."
echo -e "\e[33;1mPlease enter : \"n\", \"p\", enter, enter, \"+21G\" and \"w\"\e[0m"
fdisk /dev/sda
timedatectl
pacman -Sy wget
pvcreate /dev/sda1
vgcreate vg1 /dev/sda1
lvcreate -L 400M -n boot vg1
lvcreate -L 15G -n root vg1
lvcreate -L 5G -n home vg1
lvcreate -L 500M -n swap vg1
mkfs.ext2 /dev/vg1/boot
mkfs.ext4 /dev/vg1/root
mkfs.ext4 /dev/vg1/home
mkswap /dev/vg1/swap
swapon /dev/vg1/swap
mount /dev/vg1/root /mnt
mkdir /mnt/home
mkdir /mnt/boot
mount /dev/vg1/home /mnt/home
mount /dev/vg1/boot /mnt/boot
reflector --country France --age 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
pacstrap -K /mnt base linux linux-firmware networkmanager nano emacs zsh lvm2 grub lightdm lightdm-gtk-greeter xorg iw wpa_supplicant dialog sudo kdb openssh plasma plasma-workspace kde-applications
genfstab -U /mnt >> /mnt/etc/fstab
wget -O /mnt/arch_settinger.sh  https://github.com/Tednoob17/gamut/raw/refs/heads/main/client_tedKouhouenou/arch_settinger.sh
chmod +x /mnt/arch_settinger.sh
echo -e "\e[34;1mInstallation ended\e[0m"
echo -e "\e[34;1mPlease execute \"arch-chroot /mnt /bin/bash\" and after execute \"/mnt/arch_settinger.sh\"\e[0m"
