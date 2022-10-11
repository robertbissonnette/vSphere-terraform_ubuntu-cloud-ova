
# Cluster Information
variable "cluster_name" {
    type = string
}
variable "cluster_domain" {
    type = string
}


variable "mikrotik_host" {
    type = string
}
variable "mikrotik_username" {
    type = string
}
variable "mikrotik_password" {
    type = string
}
variable "mikrotik_tls" {
    type = bool
}
variable "mikrotik_ca_certificate" {
    type = string
}
variable "mikrotik_insecure" {
    type = bool
}


# General vCenter data
# vCenter / ESXi Username
variable "vsphere_user" {
    type = string
}

# vCenter / ESXi Password
variable "vsphere_password" {
    type = string
}
# vCenter / ESXi Endpoint
variable "vsphere_server"{
    type = string
}

# vCenter / ESXi Datacenter
variable "vsphere_datacenter" {
    type = string
}

# vCenter / ESXi Datastore
variable "vsphere_datastore" {
    type = string
}

# vCenter / ESXi ResourcePool
variable "vsphere_resource_pool" {
    type = string
}



# Node Information
# Name of OVA template (chosen in import process)
variable "node_template" {
    type = string
}

# VM Network 
variable "node_network" {
    type = string
}

# VM Number of CPU's
variable "node_cpus" {
    type = number
}

# VM Memory in MB
variable "node_memory" {
    type = number
}
# Number of nodes to deploy
variable "node_count" {
    type = number
    description = "Number of nodes to deploy"
}
