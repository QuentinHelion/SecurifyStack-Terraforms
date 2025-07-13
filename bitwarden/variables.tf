variable "target_node" {
    description = "Proxmox target node"
    type        = string
    default     = "proxmox"
}

variable "hostname" {
    description = "LXC Hostname"
    type        = string
    default     = "my-lxc"
}

variable "ostmpl" {
    description = "LXC OS Template"
    type        = string
}

variable "password" {
    description = "LXC root password"
    type        = string
}

variable "pool" {
    description = "LXC Proxmox pool"
    type        = string
}

variable "storage-location" {
    description	= "Storage location"
    type        = string
    default     = "local-lvm"
}

variable "storage-size" {
    description = "Disk size"
    type        = string
    default     = "8G"
}

variable "network-bridge" {
    description = "LXC network bridge"
    type        = string
    default     = "vmbr0"
}

variable "network-ip" {
    description = "LXC adresse"
    type        = string
}

variable "network-gw" {
    description = "LXC gateway"
    type        = string
}

variable "ssh-certificat-path" {
    description = "SSH certificat location"
    type        = string
    default     = "~/.ssh/id_rsa"
}

variable "pm_api_url" {
    description = "Proxmox api url"
    type        = string
}

variable "pm_user" {
    description = "Proxmox user"
    type        = string
}

variable "pm_password" {
    description = "Proxmox user password"
    type        = string
}

