# Terraform configuration
terraform {
  required_providers {
    mikrotik = {
      source = "ddelnano/mikrotik"
      version = "0.9.1"
    }
  }
}

provider "vsphere" {
  user           = "${var.vsphere_user}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.vsphere_server}"
  client_debug = true
  allow_unverified_ssl = true
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

module "cluster_nodes" {
  source = "./modules/terraform-vsphere-cluster_nodes"
  cluster_name = var.cluster_name
  node_count = var.node_count
  node_cpus = var.node_cpus
  node_memory = var.node_memory
  node_template = var.node_template
  node_network = var.node_network
  vsphere_datacenter = var.vsphere_datacenter
  vsphere_resource_pool = var.vsphere_resource_pool
  vsphere_datastore = var.vsphere_datastore
  vsphere_server = var.vsphere_server
  vsphere_user = var.vsphere_user
  vsphere_password = var.vsphere_password
}

module "cluster_nodes_dns_records" {
  source = "./modules/terraform-mikrotik-cluster_nodes_dns_records"
  cluster_domain = var.cluster_domain
  node_default_ip_address   = module.cluster_nodes.node_default_ip_address
  node_name                 = module.cluster_nodes.node_name
  node_count = var.node_count
  mikrotik_host = var.mikrotik_host
  mikrotik_username = var.mikrotik_username
  mikrotik_password = var.mikrotik_password 
  mikrotik_ca_certificate = var.mikrotik_ca_certificate
  mikrotik_insecure = var.mikrotik_insecure
  mikrotik_tls = var.mikrotik_tls
}

module "cluster_nodes_dns_records2" {
  source = "./modules/terraform-mikrotik-cluster_nodes_dns_records"
  cluster_domain = "alt.${var.cluster_domain}"
  node_default_ip_address   = module.cluster_nodes.node_default_ip_address
  node_name                 = module.cluster_nodes.node_name
  node_count = var.node_count
  mikrotik_host = var.mikrotik_host
  mikrotik_username = var.mikrotik_username
  mikrotik_password = var.mikrotik_password 
  mikrotik_ca_certificate = var.mikrotik_ca_certificate
  mikrotik_insecure = var.mikrotik_insecure
  mikrotik_tls = var.mikrotik_tls
}
