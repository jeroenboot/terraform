data "vsphere_virtual_machine" "template" {
  name          = "Debian10Gold"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}







resource "vsphere_virtual_machine" "debian-vm1" {
  name             = "debian-vm1"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
#  wait_for_guest_net_timeout = "0" #disable check for valid IP address

  num_cpus = 2
  memory   = 1024
  guest_id = "debian10_64Guest"

  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }

  disk {
    label = "disk0"
    size  = 20
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "debian-vm1"
        domain    = "lab.local"
      }
   }
  }


}
