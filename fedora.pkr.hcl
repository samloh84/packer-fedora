build {
  sources = [
    "source.virtualbox-iso.fedora",
    "source.vmware-iso.fedora"]

  provisioner "shell" {
    scripts = local.shell_scripts
    environment_vars = local.shell_environment_vars
  }

}
