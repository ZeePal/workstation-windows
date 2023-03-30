# ZeePal's Windows Workstation Installer
This repo is intended to provide an easy way of building my gaming workstation.

Installation is intended to run on a my [Kubuntu workstation](https://github.com/ZeePal/workstation-kubuntu) against a fresh Windows 10 install.


## Installation
### Manual Pre-Steps on Windows
- Format Disks
- Setup Page File(s)
- Install Drivers
- Login with Pin
- Move User Library Folders
  - Documents
  - Downloads
  - Music
  - Pictures
  - Videos
- Install [WinGet](https://www.microsoft.com/p/app-installer/9nblggh4nns1)
- Run `PowerShell.exe -ExecutionPolicy Bypass -File scripts/prep_for_ansible.ps1`


### Run on Kubuntu
- Update Windows IP in `inventory` file
- Run: `ansible-playbook playbook.yml -u $WINDOWS_USERNAME`
  - If `winget` fucks you about, reboot then continue ansible: `ansible-playbook playbook.yml -u $WINDOWS_USERNAME --start-at-task="Install WinGet Packages"`

### Manual Post-Steps on Windows
- Move User Library Folders
  - Google Drive
- Reboot



## TODO
- Execute locally via WSLv2 instead of Linux laptop?
