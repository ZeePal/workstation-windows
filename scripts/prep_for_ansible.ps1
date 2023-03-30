# Setup error handling.
Trap {
    $_
    Exit 1
}
$ErrorActionPreference = "Stop"

New-Item -Force -ItemType Directory -Path $env:USERPROFILE\.ssh
Add-Content -Force -Path $env:USERPROFILE\.ssh\authorized_keys -Value 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFhDMf7wSreqEJV7wKaHMDFqnDIfF6USlvXGVK71TcLi zp@zp-laptop'

$pkg_openssh = Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH.Server*' | Select-Object -ExpandProperty Name
if ($pkg_openssh.GetType() -ne [string]) {
    Throw "Unable to find single package for OpenSSH Server: $pkg_openssh"
}

Add-WindowsCapability -Online -Name $pkg_openssh
Add-Content C:\ProgramData\ssh\sshd_config "`nPasswordAuthentication no"

Set-Service -Name sshd -StartupType Manual
Start-Service sshd
