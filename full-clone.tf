# Proxmox Full-Clone
# ---
# Create a new VM from a clone

# enter the the name of the new device
resource "proxmox_vm_qemu" "srv1" {

    # VM General Settings

    # which proxmox server should this be launched on?
    target_node = "pve"
    # make sure this ID is unqiue.  If you reuse ID's you will get errors :)
    vmid = "104"
    # name of the new device again
    name = "srv1"
    desc = "# srv1 swarm"

    

    # VM Advanced General Settings
    onboot = true

    # VM OS Settings
    clone = "VM 9000"

    # make sure to install qemu-guest-agent on image cloning
    # otherwise terafform will hang creating the vm
    agent = 1

    # VM CPU Settings
    # set cpu cores
    cores = 4
    sockets = 1
    cpu = "host"

    # VM Memory Settings
    # how much ram?
    memory = 4096

    # VM Network Settings
    network {
        bridge = "vmbr0"
        model  = "virtio"
    }

    # how big for the disk image?
    disk {
        storage = "zfs"
        type = "virtio"
        size = "40G"
    }

    # VM Cloud-Init Settings
    os_type = "cloud-init"

    # (Optional) IP Address and Gateway
    # set to your network
    ipconfig0 = "ip=192.168.0.97/24,gw=192.168.0.1"

    # (Optional) Default User
    ciuser = "aovcharenko"

    # (Optional) Add your SSH KEY
    sshkeys = <<EOF
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBf5765VDUrp5mEMcD2IdA7x1kEIlMgLvL3pRbXHinRf aovcharenko@optiplex3060
EOF
}
resource "proxmox_vm_qemu" "srv2" {
    depends_on = [proxmox_vm_qemu.srv1]
    # VM General Settings

    # which proxmox server should this be launched on?
    target_node = "pve"
    # make sure this ID is unqiue.  If you reuse ID's you will get errors :)
    vmid = "105"
    # name of the new device again
    name = "srv2"
    desc = "# srv2 swarm"

    

    # VM Advanced General Settings
    onboot = true

    # VM OS Settings
    clone = "VM 9000"

    # make sure to install qemu-guest-agent on image cloning
    # otherwise terafform will hang creating the vm
    agent = 1

    # VM CPU Settings
    # set cpu cores
    cores = 4
    sockets = 1
    cpu = "host"

    # VM Memory Settings
    # how much ram?
    memory = 4096

    # VM Network Settings
    network {
        bridge = "vmbr0"
        model  = "virtio"
    }

    # how big for the disk image?
    disk {
        storage = "zfs"
        type = "virtio"
        size = "40G"
    }

    # VM Cloud-Init Settings
    os_type = "cloud-init"

    # (Optional) IP Address and Gateway
    # set to your network
    ipconfig0 = "ip=192.168.0.98/24,gw=192.168.0.1"

    # (Optional) Default User
    ciuser = "aovcharenko"

    # (Optional) Add your SSH KEY
    sshkeys = <<EOF
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBf5765VDUrp5mEMcD2IdA7x1kEIlMgLvL3pRbXHinRf aovcharenko@optiplex3060
EOF
}
resource "proxmox_vm_qemu" "srv3" {
    depends_on = [proxmox_vm_qemu.srv2]
    # VM General Settings

    # which proxmox server should this be launched on?
    target_node = "pve"
    # make sure this ID is unqiue.  If you reuse ID's you will get errors :)
    vmid = "106"
    # name of the new device again
    name = "srv3"
    desc = "# srv3 swarm"

    

    # VM Advanced General Settings
    onboot = true

    # VM OS Settings
    clone = "VM 9000"

    # make sure to install qemu-guest-agent on image cloning
    # otherwise terafform will hang creating the vm
    agent = 1

    # VM CPU Settings
    # set cpu cores
    cores = 4
    sockets = 1
    cpu = "host"

    # VM Memory Settings
    # how much ram?
    memory = 4096

    # VM Network Settings
    network {
        bridge = "vmbr0"
        model  = "virtio"
    }

    # how big for the disk image?
    disk {
        storage = "zfs"
        type = "virtio"
        size = "40G"
    }

    # VM Cloud-Init Settings
    os_type = "cloud-init"

    # (Optional) IP Address and Gateway
    # set to your network
    ipconfig0 = "ip=192.168.0.99/24,gw=192.168.0.1"

    # (Optional) Default User
    ciuser = "aovcharenko"

    # (Optional) Add your SSH KEY
    sshkeys = <<EOF
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBf5765VDUrp5mEMcD2IdA7x1kEIlMgLvL3pRbXHinRf aovcharenko@optiplex3060
EOF
}
resource "proxmox_vm_qemu" "ansible" {

    # VM General Settings

    # which proxmox server should this be launched on?
    target_node = "pve"
    # make sure this ID is unqiue.  If you reuse ID's you will get errors :)
    vmid = "107"
    # name of the new device again
    name = "ansible"
    desc = "# ansbile slerm cource"

    

    # VM Advanced General Settings
    onboot = true

    # VM OS Settings
    clone = "VM 9000"

    # make sure to install qemu-guest-agent on image cloning
    # otherwise terafform will hang creating the vm
    agent = 1

    # VM CPU Settings
    # set cpu cores
    cores = 4
    sockets = 1
    cpu = "host"

    # VM Memory Settings
    # how much ram?
    memory = 4096

    # VM Network Settings
    network {
        bridge = "vmbr0"
        model  = "virtio"
    }

    # how big for the disk image?
    disk {
        storage = "zfs"
        type = "virtio"
        size = "40G"
    }

    # VM Cloud-Init Settings
    os_type = "cloud-init"

    # (Optional) IP Address and Gateway
    # set to your network
    ipconfig0 = "ip=192.168.0.50/24,gw=192.168.0.1"

    # (Optional) Default User
    ciuser = "aovcharenko"

    # (Optional) Add your SSH KEY
    sshkeys = <<EOF
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBf5765VDUrp5mEMcD2IdA7x1kEIlMgLvL3pRbXHinRf aovcharenko@optiplex3060
EOF
}




