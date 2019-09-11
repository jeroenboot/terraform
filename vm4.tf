data "vsphere_virtual_machine" "template_vm4" {
  name          = "ubuntu1804lts_template"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}







resource "vsphere_virtual_machine" "vm4" {
  name             = "ubuntu-vm2"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = 2
  memory   = 2048
  guest_id = "ubuntu64Guest"

  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }

  disk {
    label = "disk0"
    size  = 20
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template_vm4.id}"

    customize {

      linux_options {
        host_name = "ubuntu-vm2"
        domain    = "lab.local"
      }

      network_interface {
        ipv4_address = "192.168.101.50"
        ipv4_netmask = "24"
      }

        ipv4_gateway = "192.168.101.2"

     }
  }

}
