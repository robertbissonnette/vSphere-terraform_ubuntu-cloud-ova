

// resource "coredns_record" "foo" {
//     fqdn = "foo.skydns.local"
//     type = "A"
//     rdata = [ "10.10.10.10", "10.10.10.20" ]
//     ttl = "60"
// }

resource "mikrotik_dns_record" "node_dns_record" {
  count   = "${var.node_count}"
  name    = "${var.node_name[count.index]}.${var.cluster_domain}"
  address = var.node_default_ip_address[count.index]
  ttl     = 60
}