provider "vsphere" {
  user           = "${var.vsphere_user}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.vsphere_server}"

  # If you have a self-signed cert
  allow_unverified_ssl = true
}




data "vsphere_datacenter" "dc" {
  name = "${var.vsphere_datacenter}"
}

data "vsphere_datastore" "datastore" {
  name          = "${var.vsphere_datastore}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_compute_cluster" "compute_cluster" {
  name          = "${var.vsphere_cluster}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
  name          = "${var.vsphere_resource_pool}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "${var.vsphere_network}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}



resource "vsphere_tag_category" "environment" {
    name        = "environment"
    cardinality = "SINGLE"
    associable_types = [ "VirtualMachine"]
}
 
resource "vsphere_tag_category" "region" {
    name        = "region"
    cardinality = "SINGLE"
    associable_types = ["VirtualMachine"]
}
 



resource "vsphere_tag" "environment" {
    name        = "dev-test"
    category_id = "${vsphere_tag_category.environment.id}"
}
 
resource "vsphere_tag" "region" {
    name         = "Amsterdam"
    category_id = "${vsphere_tag_category.region.id}"
}
