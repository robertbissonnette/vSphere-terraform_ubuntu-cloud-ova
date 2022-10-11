

// resource "coredns_record" "foo" {
//     fqdn = "foo.skydns.local"
//     type = "A"
//     rdata = [ "10.10.10.10", "10.10.10.20" ]
//     ttl = "60"
// }

resource "mikrotik_dns_record" "node_dns_record" {
  count   = var.node_count
  name    = "${vsphere_virtual_machine.node[count.index].name}.${var.cluster_domain}"
  address = vsphere_virtual_machine.node[count.index].default_ip_address
  ttl     = 60
}

