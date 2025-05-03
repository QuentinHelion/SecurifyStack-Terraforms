terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.11"
    }
  }
}

provider "proxmox" {
  pm_api_url      = "https://XXX:8006/api2/json"
  pm_user         = "XXXX"
  pm_password     = ""
  pm_tls_insecure = true
}
