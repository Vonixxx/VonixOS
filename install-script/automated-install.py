#######################
# Importing Libraries #
#######################
import shutil
import subprocess
from pathlib import Path


#############
# Variables #
#############
filename = "/mnt/etc/nixos/hardware-configuration.nix"


###############
# Definitions #
###############
def run_command(command, cwd=None):
    result = subprocess.run(command, cwd=cwd, capture_output=True, text=True)
    if result.returncode != 0:
        raise Exception(f"Command {command} failed: {result.stderr}")
    return result.stdout
def get_disk_devices():
    output = run_command(["parted", "--list"])
    devices = []
    for line in output.splitlines():
        if "Disk /dev/" in line:
            devices.append(line.split(":")[0].replace("Disk", "").strip())
    return devices


###############
# Choose Disk #
###############
def main():
    devices = get_disk_devices()

    print("Available disk devices:")
    for idx, device in enumerate(devices, 1):
        print(f"{idx}. {device}")

    choice = int(input("Please select a device by number: "))
    if 1 <= choice <= len(devices):
        selected_device = devices[choice-1]
        print(f"You selected: {selected_device}")
        
        print(run_command(["parted", selected_device, "print"]))
    else:
        print("Invalid choice.")

if __name__ == "__main__":
    main()


###############
# Wiping Disk #
###############
run_command(["wipefs", "-a", selected_device])


#######################
# GPT Partition Tabel #
#######################
run_command(["parted", selected_device, "mklabel", "gpt"])


############################
# Boot and Root Partitions #
############################
run_command(["parted", selected_device, "mkpart", "boot", "fat32", "1MiB", "513MiB"])
size = input("Enter desired root partition size (in GB): ")
end_position = f"{size}GiB"
run_command(["parted", selected_device, "mkpart", "nixos", "515MiB", end_position])


##############
# Formatting #
##############
run_command(["parted", selected_device, "set", "1", "esp", "on"])
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
