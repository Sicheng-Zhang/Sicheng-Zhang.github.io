<br><br>

1. **Download the Arch Linux ISO from** [https://archlinux.org/download/](https://archlinux.org/download/)

2. **Create a live USB of Arch Linux, boot from the live USB**
	- See [https://wiki.archlinux.org/title/USB_flash_installation_medium](https://wiki.archlinux.org/title/USB_flash_installation_medium) for details
	- To boot Surface Pro from USB, press and hold the volume-down button. Press and release the power button until the Surface logo appears on screen.  
3. **Connect to Wifi**
	- list network interface, enter `iwctl` interactive prompt  
		``` shell
		$ ip link
		$ iwctl
		```
	- list all Wi-Fi devices, find the wireless device name   
		``` shell
		$ device list
		```
	- scan for networks, list all available networks, and finally, connect to a network  
		``` shell
		$ station device scan
		$ station device get-networks
		$ station device connect SSID
		```
	- check the internet connection  
		``` shell
		$ ping archlinux.org
		```

4. **Partition the disks** 
	- List all the disk and partitions, select the disk for formatting and partitioning  
		``` shell
		$ fdisk -l
		$ fdisk /dev/nvme0n1
		```
	- Create an ESP partition (For UEFI systems only):
		- enter `n`, it will ask you to choose a disk number, enter 1. Stay with the default block size, when it asks for the partition size, enter `+512M`  
		<a href="https://ucarecdn.com/cf04c112-8e1b-4b33-a11c-28c6aafade5d/image_1636143911959_0.png" target="_blank" rel="noopener noreferrer"><img src="https://ucarecdn.com/cf04c112-8e1b-4b33-a11c-28c6aafade5d/image_1636143911959_0.png" alt="WESTERLIES" width="600"></a>
		- change the type of the EFI partition to EFI System by enter `t`, enter `L` to see all the partition types available and then enter its corresponding number to the EFI system  
		<a href="https://ucarecdn.com/f0c9df90-2224-4c10-9bb7-911d0b95c2a8/image_1636143969249_0.png
" target="_blank" rel="noopener noreferrer"><img src="https://ucarecdn.com/f0c9df90-2224-4c10-9bb7-911d0b95c2a8/image_1636143969249_0.png
" alt="WESTERLIES" width="600"></a>
	- Create root partition (no swap, no home)  
		- enter `n` to create a new partition. It will automatically give it partition number 2. Keep on pressing enter to allocate entire remaining disk space to the root partition.  
	- Finally, enter `w` command to write the changes and exit out of `fdisk` command  

5. **Create filesystem**
	- with two disk partitions (`nvme0n1p1` and `nvme0n1p2`), create a FAT32 file system and create an Ext4 filesystem on the root partition  
		``` shell
		$ mkfs.fat -F32 /dev/nvme0n1p1
		$ mkfs.ext4 /dev/nvme0n1p2
		```

6. **Install Arch Linux**
	- mount Arch Linux on the root directory and install the packages
		``` shell
		$ mount /dev/nvme0n1p2 /mnt
		$ pacstrap /mnt base linux linux-firmware vim sudo #add more if needed
		```

7. **Configure the Arch Linux**
	- define how disk partitions, enter the mounted disk as root  
		``` shell
		$ genfstab -U /mnt >> /mnt/etc/fstab
		$ arch-chroot /mnt
		```
	- set up timezone  
		``` shell
		$ timedatectl list-timezones
		$ timedatectl set-timezone America/Chicago
		```
	- set up `Locale`  
		- edit the flie `/etc/locale.gen`, uncomment `en_US.UTF-8`  
		- generate the locale config  
			``` shell
			$ locale-gen
			$ echo LANG=en_US.UTF-8 > /etc/locale.conf
			$ export LANG=en_GB.UTF-8
			```
	- set up network  
		- create `/etc/hostname` file and set the hostname (e.g. Camus)
			``` shell
			$ echo Camus > /etc/hostname
			$ touch /etc/hosts
			```
	- edit `/etc/hostname` by adding the following lines
		```shell
		127.0.0.1	localhost
		::1		localhost
		127.0.1.1	Camus
		```
	- set up bluetooth  
		- install `bluez` and enable the service  
			``` shell
			$ pacman -S bluez bluez-utils
			$ systemctl bluetooth.service
			```
	- set up root password  
		``` shell
		$ passwd
		```
		
8. **Install Grub bootloader**
		- make sure that you are still using arch-chroot to perform the following commands  
	``` shell
	$ pacman -S grub efibootmgr
	$ mkdir /boot/efi
	$ mount /dev/nvme0n1p1 /boot/efi
	$ grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi
	$ grub-mkconfig -o /boot/grub/grub.cfg
	```

9. **Install desktop environment**
	- install X environment `Xorg`  
		``` shell
		$ pacman -S xorg
		```
	- install GNOME and enable the display manager  
		``` shell
		$ pacman -S archlinux-keyring
		$ pacman -S gnome
		$ systemctl start gdm.service
		$ systemctl enable gdm.service
		$ pacman -S networkmanager
		$ systemctl enable NetworkManager.service
		```
	- install KDE Plasma  
		``` shell 
		$ pacman -S xorg plasma plasma-wayland-session 
		```

10. **Create a sudo user**
	- create a home directory for the new user (e.g. Sicheng), setup password  
		``` shell
		$ useradd -m Sicheng
		$ passwd Sicheng
		```
	- give the user sudo access  
		``` shell
		$ EDITOR=vim visudo
		```
	- add the following line, save and exit  
		```shell
		Sicheng ALL=(ALL) ALL
		```

**Finally, exit from chroot, restart the system.**  

<br><br>
**Tip**  
- For KDE Plasma DE, disable `baloo file extractor` can free up CPU and memory  
	``` shell
	$ balooctl monitor
	```
- Install `linux-surface` kernel to enable touch screen.  
	- [https://github.com/linux-surface/linux-surface/wiki/Installation-and-Setup#Arch](https://github.com/linux-surface/linux-surface/wiki/Installation-and-Setup#Arch)