source "virtualbox-iso" "fedora" {
  iso_urls = [
    local.iso_path,
    var.iso_url]
  iso_target_path = local.iso_path
  iso_checksum = var.iso_checksum
  iso_checksum_type = var.iso_checksum_type

  disk_size = var.disk_size

  http_directory = local.kickstart_directory

  vm_name = local.vm_name
  guest_os_type = var.virtualbox_guest_os_type

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
  format = var.virtualbox_format
}