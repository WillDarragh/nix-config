# arrakis

My SFF Desktop

## BIOS Notes
Mobo Asus ROG STRIX B550-I GAMING

BIOS Version 3702

https://rog.asus.com/motherboards/rog-strix/rog-strix-b550-i-gaming-model/helpdesk_bios/

1. Load Optimized Defaults
2. Resize BAR on
3. AI Tweaker -> Ai Overclock Tuner -> DOCP
4. Advanced -> Onboard Deviced -> PCIEX16 Mode -> PCIE Gen3 #TODO Replace with Gen4 riser
5. Advanced -> Onboard Devices -> LED Lighting -> Stealth

## Hardware Notes
2 NVME

### Primary is 2TB NVME in front of mobo
contains boot and home paritions

Chose erase disk, swap no hibernate

### Secondary is 2TB NVME in back of mobo
contains one partition for bulk storage

as sudo
```
parted /dev/nvme1n1
  mklabel gpt
  mkpart primary 0% 100%
mkfs.ext4 -L 'NVME Storage' /nvme1n1p1
mkdir -p '/mnt/NVME Storage'
mount /dev/disk/by-label/NVME\\x20Storage '/mnt/NVME Storage'/
```
then
edit fstab

## Manual Install 2025-01-13

Set timezone info to Chicago

Set keyboard to standard

Install option was unfree

Erased whole disk and installed with swap, no hibernate

User password same as administrator
