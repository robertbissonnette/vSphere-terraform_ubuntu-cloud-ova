
data "vsphere_datacenter" "dc" {
  name = "${var.vsphere_datacenter}"
}

data "vsphere_datastore" "datastore" {
  name          = "${var.vsphere_datastore}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
  name          = "${var.vsphere_resource_pool}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "${var.node_network}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_virtual_machine" "node_template" {
  name          = "${var.node_template}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

# Re-enable after https://github.com/hashicorp/terraform-provider-vsphere/issues/1763
# resource "vsphere_resource_pool" "cluster" {
#   name                    = "${var.cluster_name}.${var.cluster_domain}"
#   parent_resource_pool_id = data.vsphere_resource_pool.pool.id
# } 

resource "vsphere_virtual_machine" "node" {
  count            = "${var.node_count}"
  name             = "${var.cluster_name}-${count.index + 1}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = var.node_cpus
  memory   = var.node_memory
  guest_id = "${data.vsphere_virtual_machine.node_template.guest_id}"

  scsi_type = "${data.vsphere_virtual_machine.node_template.scsi_type}"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.node_template.network_interface_types[0]}"
  }

  disk {
    label            = "disk0"
    size             = "${data.vsphere_virtual_machine.node_template.disks.0.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.node_template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.node_template.disks.0.thin_provisioned}"
  }

  cdrom {
    client_device = true
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.node_template.id}"
  }

  vapp {
    properties = {
      hostname = "${var.cluster_name}-${count.index + 1}"
      user-data = base64gzip(file("${path.module}/cloud-init.yml"))
    }
  }
}
