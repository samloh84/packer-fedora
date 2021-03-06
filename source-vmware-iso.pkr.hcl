source "vmware-iso" "fedora" {
  iso_urls = [
    local.iso_path,
    var.iso_url]
  iso_target_path = local.iso_path
  iso_checksum = var.iso_checksum
  iso_checksum_type = var.iso_checksum_type

  vmdk_name = local.vm_name

  disk_size = var.disk_size
  disk_type_id = var.vmware_disk_type_id

  http_directory = local.http_directory

  vm_name = local.vm_name
  guest_os_type = var.vmware_guest_os_type

  shutdown_command = var.shutdown_command

  communicator = "ssh"
  ssh_username = var.ssh_username
  ssh_password = var.ssh_password
  ssh_port = var.ssh_port
  ssh_timeout = var.ssh_timeout
  boot_command = var.boot_command

  headless = var.headless
  output_directory = local.output_directory

  cpus = var.cpus
  memory = var.memory
  cores = var.cores

}