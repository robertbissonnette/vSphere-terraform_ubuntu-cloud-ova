# Output variable definitions

# Cluster Node configurations
# Node Name
output "node_name" {
  description = "Name of the node"
  value = vsphere_virtual_machine.node.*.name
}

output "node_default_ip_address" {
  description = "Default IP Address of the node"
  value = vsphere_virtual_machine.node.*.default_ip_address
}

output "node_dns_address" {
  description = "FQDN for node"
  value   = mikrotik_dns_record.node_dns_record.*.name
}