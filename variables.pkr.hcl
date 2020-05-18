variable "iso_path" {
  type = string
  default = null
}

variable "working_folder" {
  type = string
  default = "."
}

variable "iso_folder" {
  type = string
  default = "iso"
}

variable "http_folder" {
  type = string
  default = "http"
}

variable "output_folder" {
  type = string
  default = "output"
}
variable "iso_filename" {
  type = string
}

variable "iso_url" {
  type = string
}

variable "iso_checksum" {
  type = string
}

variable "iso_checksum_type" {
  type = string
  default = "sha256"
}


variable "vmware_guest_os_type" {
  type = string
  default = "fedora-64"
}

variable "virtualbox_guest_os_type" {
  type = string
  default = "Fedora_64"
}

variable "disk_size" {
  type = number
  default = 200000
}


variable "vmware_disk_type_id" {
  type = number
  default = 0
}

variable "distribution" {
  type = string
  default = "fedora"
}

variable "distribution_major_version" {
  type = string
}

variable "distribution_variant" {
  type = string
}

variable "http_directory" {
  type = string
  default = null
}

variable "shutdown_command" {
  type = string
  default = "sudo shutdown -h now"
}

variable "ssh_username" {
  type = string
  default = "vagrant"
}
variable "ssh_password" {
  type = string
  default = "vagrant"
}


variable "ssh_port" {
  type = number
  default = 22
}

variable "boot_command" {
  type = list(string)
  default = [
    "<tab><wait>",
    " ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/anaconda-ks.cfg<enter>"]
}

variable "headless" {
  type = bool
  default = false
}

variable "output_directory" {
  type = string
  default = null
}

variable "cpus" {
  type = number
  default = 2
}

variable "memory" {
  type = number
  default = 4096
}

variable "vmware_cores" {
  type = number
  default = 1
}

variable "ssh_timeout" {
  type = string
  default = "1h"
}

variable "virtualbox_format" {
  type = string
  default = "ova"
}

variable "shell_scripts" {
  type = list(string)
  default = []
}

variable "shell_environment_vars" {
  type = list(string)
  default = []
}


locals {
  vm_name = join("-", [for name_component in [
    var.distribution,
    var.distribution_major_version,
    var.distribution_variant]: name_component if name_component!=null && name_component!=""])
  iso_path = coalesce(var.iso_path, "${var.working_folder}/${var.iso_folder}/${var.iso_filename}")
  http_directory = coalesce(var.http_directory, "./${var.http_folder}/${local.vm_name}")
  output_directory = coalesce(var.output_directory, "${var.working_folder}/${var.output_folder}/{{ build_type }}/${local.vm_name}")
  shell_scripts = concat(var.shell_scripts, [
    "scripts/cleanup.sh"])
  shell_environment_vars = concat(var.shell_environment_vars, [
    "DISTRIBUTION=${var.distribution}",
    "DISTRIBUTION_MAJOR_VERSION=${var.distribution_major_version}",
    "DISTRIBUTION_VARIANT=${var.distribution_variant}",
    "SSH_USERNAME=${var.ssh_username}",
    "SSH_PASSWORD=${var.ssh_password}",
  ])
}
