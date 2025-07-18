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
    ip     = "${var.network-ip}/${var.network-mask}"
    gw     = var.network-gw
  }

  features {
    nesting = true
  }

  ssh_public_keys = file("${var.ssh-certificat-path}.pub")

  provisioner "remote-exec" {
    inline = [
      "apt-get update",
      "DEBIAN_FRONTEND=noninteractive apt-get install -y curl gnupg2",
      "curl -fsSL https://get.docker.com | sh",
      "systemctl enable --now docker",
      "adduser --disabled-password --gecos '' bitwarden",
      "echo 'bitwarden:bitwarden' | chpasswd",
      "groupadd docker || true",
      "usermod -aG docker bitwarden",
      "mkdir -p /opt/bitwarden /opt/bitwarden/bwdata",
      "chown -R bitwarden:bitwarden /opt/bitwarden",
      "chmod 700 /opt/bitwarden",
      "su - bitwarden -c \"cd /opt/bitwarden && curl -Lso bitwarden.sh 'https://func.bitwarden.com/api/dl/?app=self-host&platform=linux' && chmod 700 bitwarden.sh\"",
      "su - bitwarden -c \"cd /opt/bitwarden && printf 'y\\n\\n${var.bitwarden_email}\\n\\n\\n\\nn\\ny\\n' | ./bitwarden.sh install --agree-to-terms --data=/opt/bitwarden/bwdata\"",
      "su - bitwarden -c \"cd /opt/bitwarden && printf 'y\\n' | ./bitwarden.sh start\""
    ]

    connection {
      type        = "ssh"
      host        = var.network-ip
      user        = "root"
      private_key = file("~/.ssh/id_rsa")
      # timeout = "5m"
    }
  }

  start = true
}
