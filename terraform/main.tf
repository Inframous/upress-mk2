
resource "proxmox_vm_qemu" "your-vm" {
    
    # VM General Settings
    target_node = "gserver"
    vmid = "19${count.index}"
    name = "CentOS-${count.index + 1}"
    desc = "Description"

    count = 4

    # VM Advanced General Settings
    onboot = true 

    # VM OS Settings
    # clone = "ubuntu-server-jammy"
    clone = "CentOS"
    full_clone = false

    # Qemu Guest Agent
    agent = 1
    
    # VM CPU Settings
    cores = 2
    sockets = 1
    cpu = "host"    
    
    # VM Memory Settings
    memory = 2048

    # VM Network Settings
    network {
        bridge = "vmbr0"
        model  = "virtio"
    }

    # VM Cloud-Init Settings
    os_type = "cloud-init"

    # (Optional) IP Address and Gateway
    ipconfig0 = "ip=10.5.5.9${count.index + 5}/24,gw=10.5.5.1"
    
    # (Optional) Default User
    ciuser = "gabe"
    
    # (Optional) Add your SSH KEY
    sshkeys = file("~/.ssh/keys/M1.pub")
}