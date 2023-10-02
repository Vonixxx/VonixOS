###########
# VonixOS #
#############################################
# Automated Installation Script (Functions) #
#############################################
import re
import getpass
import subprocess

##########
# Titles #
##########
def printSectionTitle(title):
    print("\n" + "#" * (len(title) + 3))
    print(f"# {title} #")
    print("#" * (len(title) + 3) + "\n")

######################
# Disk Naming Scheme #
######################
def getPartitionName(device, partition_number):
    if "nvme" in device:
        return f"{device}p{partition_number}"
    else:
        return f"{device}{partition_number}"
#########################
# Choose Disk from List #
#########################
def chooseDisk():
    devices = getDiskDevices()

    print("Available disk devices:")
    for idx, device in enumerate(devices, 1):
        print(f"{idx}. {device}")

    choice = int(input("Select: "))
    if 1 <= choice <= len(devices):
        selectedDevice = devices[choice-1]
        print(f"You selected: {selectedDevice}")

        print(runCommand(["parted", selectedDevice, "print"]))
        return selectedDevice
    else:
        print("Invalid choice.")
        return None
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
####################
# Execute Commands #
####################
def runCommand(command, cwd=None):
    result = subprocess.run(command, cwd=cwd, capture_output=True, text=True)
    if result.returncode != 0:
        raise Exception(f"Command {command} failed: {result.stderr}")
    return result.stdout
###################################
# Prompt User to Modify Variables #
###################################
def getHashedPassword():
    password = getpass.getpass(prompt="Password: ")
    hashedPassword = runCommand(["mkpasswd", "-m", "sha-512", password])
    return hashedPassword.strip()

def getUsername():
    username = input("Enter: ")
    return username

def promptFlakeValues():
    variables = {
        "user": input("Username: "),
        "password": getHashedPassword(),
        "githubuser": input("GitHub Username: "),
        "githubemail": input("GitHub E-mail: "),
        "defaultlocale": input("Default Locale: "),
        "extralocale": input("Extra Locale: ")
    }
    return variables

def inputUserValues(contents, key, value):
    pattern = f'({key}\\s*=\\s*")([^"]*)(";)'
    replacement = f'\\1{value}\\3'
    return re.sub(pattern, replacement, contents)

def updateFlakeFile(variables, cwd=None):
    with open("./flake.nix", 'r') as file:
        contents = file.read()
    contents = inputUserValues(contents, "user", variables["user"])
    contents = inputUserValues(contents, "password", variables["password"])
    contents = inputUserValues(contents, "githubuser", variables["githubuser"])
    contents = inputUserValues(contents, "githubemail", variables["githubemail"])
    contents = inputUserValues(contents, "defaultlocale", variables["defaultlocale"])
    contents = inputUserValues(contents, "extralocale", variables["extralocale"])
    with open("./flake.nix", 'w') as file:
        file.write(contents)
