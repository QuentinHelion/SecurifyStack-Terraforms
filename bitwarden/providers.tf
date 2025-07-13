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
  pm_api_url      = var.pmurl
  pm_user         = var.pmuser
  pm_password     = var.pmpassword
  pm_tls_insecure = true
}

