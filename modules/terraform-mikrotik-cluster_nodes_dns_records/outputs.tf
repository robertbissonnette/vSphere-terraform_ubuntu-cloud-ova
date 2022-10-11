
output "node_dns_address" {
  description = "FQDN for node"
  value   = mikrotik_dns_record.node_dns_record.*.name
}