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
  pm_api_url      = var.pm_api_url
  pm_user         = var.pm_user
  pm_password     = var.pm_password
  pm_tls_insecure = true
}

