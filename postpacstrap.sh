#!/bin/bash

if [ $1 = "-h" ]; then
	echo "Usage: postpacstrap.sh <hostname> <disk>"
	exit
fi

$HOSTNAME = $1
$DISK = $2

if [[ $(whoami) != "root" ]]; then
	echo "This should be run as root."
	exit
fi

echo "Generating locales, creating hostname files..."
ln -sf /usr/share/zoneinfo/US/Pacific /etc/localtime
hwclock --systohc
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo $HOSTNAME > /etc/hostname
echo "127.0.0.1\tlocalhost" > /etc/hosts
echo "::1\tlocalhost" >> /etc/hosts
echo "127.0.1.1\t$HOSTNAME.localdomain\t$HOSTNAME" >> /etc/hosts

read -p "Set up wireless networking? (y/n): " -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
	pacman -S iw wpa_supplicant
	echo "ctrl_interface=/run/wpa_supplicant" > /etc/wpa_supplicant/wpa_supplicant.conf
	echo "ctrl_interface_group=wheel" >> /etc/wpa_supplicant/wpa_supplicant.conf
	echo "update_config=1" >> /etc/wpa_supplicant/wpa_supplicant.conf
	echo "country=US" >> /etc/wpa_supplicant/wpa_supplicant.conf
	echo "ap_scan=1" >> /etc/wpa_supplicant/wpa_supplicant.conf
	ln -s /usr/share/dhcpcd/hooks/10-wpa_supplicant /usr/lib/dhcpcd/dhcpcd-hooks/
fi
systemctl enable dhcpcd

passwd
echo "Setting up bootloader..."
pacman -S grub efibootmgr os-prober
grub-install $DISK
grub-mkconfig -o /boot/grub/grub.cfg
read -p "Running an Intel CPU? (y/n): " -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
	pacman -S intel-ucode
fi

echo "Done! Exit the chroot, reboot into the new system, and run bootstrap.sh."
