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
  pm_api_url      = "https://XXX:8006/api2/json"
  pm_user         = "XXXX"
  pm_password     = ""
  pm_tls_insecure = true
}

