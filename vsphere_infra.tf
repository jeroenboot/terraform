provider "vsphere" {
  user           = "${var.vsphere_user}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.vsphere_server}"

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "Datacenter" #name of the datacenter
}

data "vsphere_datastore" "datastore" {
  name          = "datastore1_host1" #name of the datastore
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_host" "host" {
  name          = "host1.lab.local" #host to deploy VM on
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
  name          = "Normal" #name of the resource_pool
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "VM Network" #name of the virtual_network
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
