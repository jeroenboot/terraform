data "vsphere_virtual_machine" "template" {
  name          = "ubuntu1804lts_template"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}







resource "vsphere_virtual_machine" "ubuntu-vm1" {
  name             = "ubuntu-vm1"
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
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {

      linux_options {
        host_name = "ubuntu-vm1"
        domain    = "lab.local"
      }

      network_interface {  # comment out these values for DHCP
      }

     }
  }

}
