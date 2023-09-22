#######################
# Importing Libraries #
#######################
import shutil
import subprocess
from pathlib import Path


###############
# Definitions #
###############
filename = "/mnt/etc/nixos/hardware-configuration.nix"
def run_command(command, cwd=None):
    result = subprocess.run(command, cwd=cwd)
    if result.returncode != 0:
        raise Exception(f"Command {command} failed with code {result.returncode}")
    return result


###############
# Wiping Disk #
###############
run_command(["wipefs", "-a", "/dev/nvme0n1"])


#######################
# GPT Partition Tabel #
#######################
run_command(["parted", "/dev/nvme0n1", "mklabel", "gpt"])


############################
# Boot and Root Partitions #
############################
run_command(["parted", "/dev/nvme0n1", "mkpart", "boot", "fat32", "1MiB", "513MiB"])
run_command(["parted", "/dev/nvme0n1", "mkpart", "nixos", "515MiB", "236096MiB"])


##############
# Formatting #
##############
run_command(["parted", "/dev/nvme0n1", "set", "1", "esp", "on"])
run_command(["mkfs.vfat", "/dev/nvme0n1p1"])
run_command(["mkfs.ext4", "/dev/nvme0n1p2"])


############################
# Mounting Nixos Partition #
############################
run_command(["mount", "/dev/nvme0n1p2", "/mnt"])


##########################
# Mounting EFI Partition #
##########################
run_command(["mkdir", "-p", "/mnt/boot"])
run_command(["mount", "/dev/nvme0n1p1", "/mnt/boot"])


#############################
# Cloning GitHub Repository #
#############################
run_command(["git", "clone", "https://github.com/Vonixxx/VonixOS.git", "/home/nixos/VonixOS"])


##########################################
# Generating Default NixOS Configuration #
##########################################
run_command(["nixos-generate-config", "--root", "/mnt"])


########################################
# Copying Personal NixOS Configuration #
########################################
shutil.copytree("/home/nixos/VonixOS", "/mnt/etc/nixos", dirs_exist_ok=True)


###################################
# Initialising NixOS Installation #
###################################
run_command(["nixos-install"], cwd="/mnt/etc/nixos")


###############################################
# Copying Personal NixOS Configuration > Home #
# + Initialising as Git Repository            #
###############################################
shutil.copytree("/home/nixos/VonixOS", "/mnt/home/vonix/VonixOS", dirs_exist_ok=True)
run_command(["git", "config", "user.name", "'Vonixxx'"], cwd="/mnt/home/vonix/VonixOS")
run_command(["git", "config", "user.email", "vonixxxwork@tuta.io"], cwd="/mnt/home/vonix/VonixOS")


############################################
# Adding Swap > hardware-configuration.nix #
############################################
content = '''{
    device = "/var/swap";
    size = 8*1024;
  }'''
with open(filename, 'r') as file:
    contents = file.read()
contents = contents.replace('swapDevices = [ ];', f'swapDevices = [ {content} ];')
with open(filename, 'w') as file:
    file.write(contents)
