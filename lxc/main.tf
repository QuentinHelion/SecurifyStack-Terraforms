resource "proxmox_lxc" "basic" {
  target_node  = "proxmox"
  hostname     = "test-terraform"
  ostemplate   = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
  password     = "proxmox"
  unprivileged = true
  pool    = "VLAN30"

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr4"
    ip     = "192.170.30.20/24"
    gw     = "192.170.30.254"
  }
}