output "ip_vm1" {
   value = "${vsphere_virtual_machine.vm1.*.default_ip_address}"
}

output "ip_vm2" {
   value = "${vsphere_virtual_machine.vm2.*.default_ip_address}"
}

output "ip_vm3" {
   value = "${vsphere_virtual_machine.vm3.*.default_ip_address}"
}

output "ip_vm4" {
   value = "${vsphere_virtual_machine.vm4.*.default_ip_address}"
}
