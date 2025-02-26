terraform {
  required_version = ">= 1.6.3"
  required_providers {
    proxmox = {
      version = ">= 2.9.14"
      source  = "telmate/proxmox"
    }
  }
}

provider "proxmox" {
  pm_api_url      = "https://192.168.1.250:8006/api2/json"
  pm_user         = "root@pam"
  pm_password     = "!Quentin123"
  pm_tls_insecure = true
}

