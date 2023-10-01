#######################
# Importing Libraries #
#######################
import os
import shutil
import subprocess
from pathlib import Path

####################
# Execute Commands #
####################
def runCommand(command, cwd=None):
    result = subprocess.run(command, cwd=cwd, capture_output=True, text=True)
    if result.returncode != 0:
        raise Exception(f"Command {command} failed: {result.stderr}")
    return result.stdout
######################
# Print Disk Devices #
######################
def getDiskDevices():
    output = runCommand(["parted", "--list"])
    devices = []
    for line in output.splitlines():
        if "Disk /dev/" in line:
            devices.append(line.split(":")[0].replace("Disk", "").strip())
    return devices
#########################
# Choose Disk from List #
#########################
def chooseDisk():
    devices = getDiskDevices()

    print("Available disk devices:")
    for idx, device in enumerate(devices, 1):
        print(f"{idx}. {device}")

    choice = int(input("Please select a device by number: "))
    if 1 <= choice <= len(devices):
        selectedDevice = devices[choice-1]
        print(f"You selected: {selectedDevice}")

        print(runCommand(["parted", selectedDevice, "print"]))
        return selectedDevice
    else:
        print("Invalid choice.")
        return None
selectedDevice = chooseDisk()
if not selectedDevice:
    print("No disk selected. Exiting script.")
    exit()
######################
# Disk Naming Scheme #
######################
def getPartitionName(device, partition_number):
    if "nvme" in device:
        return f"{device}p{partition_number}"
    else:
        return f"{device}{partition_number}"

###############
# Wiping Disk #
###############
runCommand(["wipefs", "-a", selectedDevice])

#######################
# GPT Partition Table #
#######################
runCommand(["parted", selectedDevice, "mklabel", "gpt"])

############################
# Boot and Root Partitions #
############################
runCommand(["parted", selectedDevice, "mkpart", "boot", "fat32", "1MiB", "513MiB"])
size = input("Enter root partition size (in GiB): ")
endPosition = f"{size}GiB"
runCommand(["parted", selectedDevice, "mkpart", "nixos", "515MiB", endPosition])

##############
# Formatting #
##############
runCommand(["parted", selectedDevice, "set", "1", "esp", "on"])
runCommand(["mkfs.vfat", getPartitionName(selectedDevice, 1)])
runCommand(["mkfs.ext4", getPartitionName(selectedDevice, 2)])

###########################
# Mounting Root Partition #
###########################
runCommand(["mount", getPartitionName(selectedDevice, 2),  "/mnt"])

##########################
# Mounting EFI Partition #
##########################
runCommand(["mkdir", "-p", "/mnt/boot"])
runCommand(["mount", getPartitionName(selectedDevice, 1), "/mnt/boot"])

#############################
# Cloning GitHub Repository #
#############################
runCommand(["git", "clone", "https://github.com/Vonixxx/VonixOS.git", "/home/nixos/VonixOS"])

##########################################
# Generating Default NixOS Configuration #
##########################################
runCommand(["nixos-generate-config", "--root", "/mnt"])

########################################
# Copying Personal NixOS Configuration #
########################################
shutil.copytree("/home/nixos/VonixOS", "/mnt/home/vonix/VonixOS")

##################################################
# Copying System-Specific Hardware Configuration #
##################################################
host = input("Enter host (laptop/desktop) in the following format: <host> --> ")
destination = f"/mnt/home/vonix/VonixOS/hosts/{host}"
shutil.copy2("/mnt/etc/nixos/hardware-configuration.nix", destination)


############################################
# Adding Swap > hardware-configuration.nix #
############################################
hardwareConfiguration = f"{destination}/hardware-configuration.nix" 
content = '''{
    device = "/var/swap";
    size = 16*1024;
  }'''
with open(hardwareConfiguration, 'r') as file:
    contents = file.read()
contents = contents.replace('swapDevices = [ ];', f'swapDevices = [ {content} ];')
with open(hardwareConfiguration, 'w') as file:
    file.write(contents)

#########################################
# Initialising Flake/NixOS Installation #
#########################################
os.system(f"cd /mnt/home/vonix/VonixOS && nixos-install --flake .#{host}; exec $SHELL")
