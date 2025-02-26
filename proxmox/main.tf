terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = ">=2.9.11"
    }
  }
}

provider "proxmox" {
  pm_api_url      = "https://192.192.1.250:8006/api2/json"
  pm_user         = "root@pam"
  pm_password     = "!Quentin123"
  pm_tls_insecure = true
}

