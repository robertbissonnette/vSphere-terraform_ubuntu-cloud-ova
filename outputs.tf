# Output variable definitions

# Virtual Machine configuration
# Node Name
output "node_name" {
  description = "Machine name for node without domain"
  value       = module.cluster_nodes.node_name
}

output "node_default_ip_address" {
  description = "Address of the node without the domain name"
  value       = module.cluster_nodes.node_default_ip_address
}

output "node_dns_address" {
  description = "FQDN for node"
  value   = module.cluster_nodes_dns_records.node_dns_address
}