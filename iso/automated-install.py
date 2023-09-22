#######################
# Importing Libraries #
#######################
import shutil
import subprocess
from pathlib import Path


###############
# Definitions #
###############
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


#############
# Swap File #
#############
run_command(["dd", "if=/dev/zero", "of=/mnt/swap", "bs=1M", "count=8192"])
run_command(["chmod", "600", "/mnt/swap"])
run_command(["mkswap", "/mnt/swap"])
run_command(["swapon", "/mnt/swap"])


##########################
# Mounting EFI Partition #
##########################
run_command(["mkdir", "-p", "/mnt/boot"])
run_command(["mount", "/dev/nvme0n1p1", "/mnt/boot"])


#############################
# Cloning GitHub Repository #
#############################
run_command(["git", "clone", "https://github.com/Vonixxx/VonixOS.git", "/home/nixos/NixOS"])


##########################################
# Generating Default NixOS Configuration #
##########################################
run_command(["nixos-generate-config", "--root", "/mnt"])


########################################
# Copying Personal NixOS Configuration #
########################################
shutil.copytree("/home/nixos/NixOS", "/mnt/etc/nixos", dirs_exist_ok=True)


###################################
# Initialising NixOS Installation #
###################################
run_command(["nixos-install"], cwd="/mnt/etc/nixos")


###############################################
# Copying Personal NixOS Configuration > Home #
# + Initialising as Git Repository            #
###############################################
shutil.copytree("/home/nixos/NixOS", "/mnt/home/vonix/NixOS", dirs_exist_ok=True)
run_command(["git", "config", "user.name", "'Vonixxx'"], cwd="/mnt/home/vonix/NixOS")
run_command(["git", "config", "user.email", "vonixxxwork@tuta.io"], cwd="/mnt/home/vonix/NixOS")
run_command(["git", "config", "init.defaultBranch", "main"], cwd="/mnt/home/vonix/NixOS")


##########################
# Appending Swap > fstab #
##########################
run_command(["mount", "-o", "remount,rw", "/mnt"])
with open("/mnt/etc/fstab", "a") as f:
    f.write("/swap none swap sw 0 0\n")
