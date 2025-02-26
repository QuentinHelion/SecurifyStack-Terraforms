resource "proxmox_vm_qemu" "vm1" {
  name        = "my-cloudinit-vm"
  target_node = "proxmox"
  clone       = "ubuntu-cloudinit"

  agent       = 1
  cores       = 2
  memory      = 2048
  os_type     = "cloud-init"

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  disk {
    type    = "scsi"
    storage = "local-lvm"
    size    = "10G"
  }

  cloudinit_cdrom_storage = "local-lvm"

  ipconfig0 = "ip=192.168.1.100/24,gw=192.168.1.1"
}

