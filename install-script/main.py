###########
# VonixOS #
#################################
# Automated Installation Script #
#################################
import os
import shutil
import subprocess
from pathlib import Path
from functions import runCommand, chooseDisk, getUsername, getDiskDevices, getPartitionName

#####################################
# Wiping Disk + GPT Partition Table #
#####################################
runCommand(["wipefs", "-a", selectedDevice])
runCommand(["parted", selectedDevice, "mklabel", "gpt"])

##############
# Partitions #
##############
runCommand(["parted", selectedDevice, "mkpart", "boot", "fat32", "1MiB", "513MiB"])
size = input("Root Partition Size (GiB): ")
endPosition = f"{size}GiB"
runCommand(["parted", selectedDevice, "mkpart", "nixos", "515MiB", endPosition])

##############
# Formatting #
##############
runCommand(["parted", selectedDevice, "set", "1", "esp", "on"])
runCommand(["mkfs.vfat", getPartitionName(selectedDevice, 1)])
runCommand(["mkfs.ext4", getPartitionName(selectedDevice, 2)])

############
# Mounting #
############
runCommand(["mount", getPartitionName(selectedDevice, 2),  "/mnt"])
runCommand(["mkdir", "-p", "/mnt/boot"])
runCommand(["mount", getPartitionName(selectedDevice, 1), "/mnt/boot"])

##########################################
# Generating Default NixOS Configuration #
##########################################
runCommand(["nixos-generate-config", "--root", "/mnt"])

##################################
# Grabbing VonixOS Configuration #
##################################
user = getUsername()
runCommand(["git", "clone", "https://github.com/Vonixxx/VonixOS.git", f"/mnt/home/{user}/VonixOS"])

##################################################
# Copying System-Specific Hardware Configuration #
##################################################
host = input("Enter host (laptop/desktop) in the following format: <host> --> ")
destination = f"/mnt/home/{user}/VonixOS/hosts/{host}"
shutil.copy2("/mnt/etc/nixos/hardware-configuration.nix", destination)

##############################################
# Adding Swap --> hardware-configuration.nix #
##############################################
hardwareConfiguration = f"{destination}/hardware-configuration.nix"
swapMultiplier = int(input("Swap Multiplier (e.g. 16 for 16GB, 8 for 8GB): "))
content = f'''{{
    device = "/var/swap";
    size   = {swapMultiplier}*1024;
}}'''
with open(hardwareConfiguration, 'r') as file:
    contents = file.read()
contents = contents.replace('swapDevices = [ ];', f'swapDevices = [ {content} ];')
with open(hardwareConfiguration, 'w') as file:
    file.write(contents)

#########################################
# Initialising Flake/NixOS Installation #
#########################################
os.system(f"cd /mnt/home/{user}/VonixOS && nixos-install --flake .#{host}; exec $SHELL")
