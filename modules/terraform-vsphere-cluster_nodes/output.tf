output "node_name" {
  description = "Name of the node"
  value = vsphere_virtual_machine.node.*.name
}

output "node_default_ip_address" {
  description = "Default IP Address of the node"
  value = vsphere_virtual_machine.node.*.default_ip_address
}