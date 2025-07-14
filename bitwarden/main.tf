resource "proxmox_lxc" "bitwarden" {
  target_node  = var.target_node
  hostname     = var.hostname
  ostemplate   = var.ostmpl
  password     = var.password
  unprivileged = true
  pool         = var.pool

  rootfs {
    storage = var.storage-location
    size    = var.storage-size
  }

  network {
    name   = "eth0"
    bridge = var.network-bridge
    ip     = var.network-ip
    gw     = var.network-gw
  }

  features {
    nesting = true
  }

  ssh_public_keys = file("${var.ssh-certificat-path}.pub")

  provisioner "remote-exec" {
    inline = [
      "apt update && apt install -y curl", 
      "curl -fsSL https://get.docker.com | sh",
      "systemctl start docker && systemctl enable docker",
      "mkdir /opt/bitwarden",
      "printf 'bitwarden\nbitwarden\n\n\n\n\n\n\n' | adduser bitwarden",
      "chmod -R 700 /opt/bitwarden",
      "chown -R bitwarden:bitwarden /opt/bitwarden",
      "usermod -aG docker bitwarden",
      "apt install curl -y",
      "su - bitwarden",
      "curl -Lso bitwarden.sh 'https://func.bitwarden.com/api/dl/?app=self-host&platform=linux' && chmod 700 bitwarden.sh",
      "printf 'y\n192.170.10.200\nn\nvault\n' | ./bitwarden.sh install --agree-to-terms --email email@example.com",
      "printf 'y\n' | ./bitwarden.sh start"

    ]

    connection {
      type        = "ssh"
      user        = "root"
      private_key = file("~/.ssh/id_rsa")
      host        = var.network-ip
    }
  }
  
  start = true
}
