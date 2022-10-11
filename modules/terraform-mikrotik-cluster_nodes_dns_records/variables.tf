# mikrotik Configuration
variable "mikrotik_host" {
  default = "hostname-of-server:8728"     # Or set MIKROTIK_HOST environment variable
}
variable "mikrotik_username" {
  default = "<username>"                  # Or set MIKROTIK_USER environment variable
}
variable "mikrotik_password" {
  default = "<password>"                  # Or set MIKROTIK_PASSWORD environment variable
}

variable "mikrotik_tls" {
  default = "false"                    # Or set MIKROTIK_TLS environment variable
}
variable "mikrotik_ca_certificate" { 
  default = "/path/to/ca/certificate.pem" # Or set MIKROTIK_CA_CERTIFICATE environment variable
}
variable "mikrotik_insecure" {
  default = "true"                    # Or set MIKROTIK_INSECURE environment variable
}

# Node Configuration
variable "node_default_ip_address" {
  type = list(string)
}

variable "node_name" {
  type = list(string)
}

variable "cluster_domain" {
  default = "example.com"
}

# Number of nodes to deploy
variable "node_count" {
  type = number
  description = "Number of nodes to deploy"
}