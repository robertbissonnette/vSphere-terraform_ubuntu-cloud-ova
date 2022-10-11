# General vCenter data
# vCenter / ESXi Username
variable "vsphere_user" {}

# vCenter / ESXi Password
variable "vsphere_password" {}

# vCenter / ESXi Endpoint
variable "vsphere_server" {}

# vCenter / ESXi Datacenter
variable "vsphere_datacenter" {}

# vCenter / ESXi Datastore
variable "vsphere_datastore" {}

# vCenter / ESXi ResourcePool
variable "vsphere_resource_pool" {}

# Virtual Machine configuration
# VM Name
variable "cluster_name" {}

# Name of OVA template (chosen in import process)
variable "node_template" {}

# VM Network 
variable "node_network" {}

# VM Number of CPU's
variable "node_cpus" {}

# VM Memory in MB
variable "node_memory" {}

# Number of nodes to deploy
variable "node_count" {
    type = number
    description = "Number of nodes to deploy"
}
