import subprocess

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
filePath = "/mnt/home/{user}/VonixOS/flake.nix"
def getUsername():
    username = input("Desired Username: ")
    return username

def promptFlakeValues():
    variables = {
        "user": input("User: "),
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

def updateFlakeFile(variables):
    with open(filePath, 'r') as file:
        contents = file.read()
    contents = inputUserValues(contents, "user", variables["user"])
    contents = inputUserValues(contents, "githubuser", variables["githubuser"])
    contents = inputUserValues(contents, "githubemail", variables["githubemail"])
    contents = inputUserValues(contents, "defaultlocale", variables["defaultlocale"])
    contents = inputUserValues(contents, "extralocale", variables["extralocale"])
    with open(filePath, 'w') as file:
        file.write(contents)
