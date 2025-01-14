terraform {
  required_providers {
    mikrotik = {
      source = "ddelnano/mikrotik"
      version = "0.9.1"
    }
  }
}

provider "mikrotik" {
  # Configuration options
  host              = "${var.mikrotik_host}"     # Or set MIKROTIK_HOST environment variable
  username          = var.mikrotik_username              # Or set MIKROTIK_USER environment variable
  password          = var.mikrotik_password              # Or set MIKROTIK_PASSWORD environment variable
  tls               = var.mikrotik_tls                     # Or set MIKROTIK_TLS environment variable
  ca_certificate    = var.mikrotik_ca_certificate    # Or set MIKROTIK_CA_CERTIFICATE environment variable
  insecure          = var.mikrotik_insecure                # Or set MIKROTIK_INSECURE environment variable
}