resource "vsphere_virtual_machine" "vm2" {
  name             = "terraform-vm2"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  wait_for_guest_net_timeout = "0" #disable check for valid IP address

  num_cpus = 2
  memory   = 512
  guest_id = "other3xLinux64Guest"

  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }

  cdrom {
    datastore_id     = "${data.vsphere_datastore.datastore.id}"
    path             = "ISOs/TinyCore-current.iso"
  }

  disk {
    label = "disk0"
    size  = 20
  }
}
