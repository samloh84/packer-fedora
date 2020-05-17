# Packer Scripts - Fedora

This is my collection of [HashiCorp Packer][hashicorp-packer] scripts for 
building [Fedora][fedora] virtual machines using 
[VMware Workstation][vmware-workstation] and 
[Oracle VirtualBox][oracle-virtualbox], primarily written for execution on my 
Windows desktop machines to build development environments. 

[hashicorp-packer]: https://www.packer.io/
[fedora]: https://getfedora.org/
[vmware-workstation]: https://www.vmware.com/sg/products/workstation-pro.html
[oracle-virtualbox]: https://www.virtualbox.org/

## Prerequisites

* Install at least one the following virtual machine hypervisors:
    * [VMWare Workstation][vmware-workstation] 
    * [Oracle VirtualBox][oracle-virtualbox]

* Install [HashiCorp Packer][hashicorp-packer]

* For conversion of VMware `.vmx` files to `.ova`, install the 
[VMware OVF Tool][vmware-ovf-tool]

[vmware-ovf-tool]: https://code.vmware.com/web/tool/4.4.0/ovf

## Building a Virtual Machine

Run the following commands from a terminal:
    
    cd project-directory
    packer build -force [-var-file chosen-fedora-version-variation-file.pkvars.hcl] [-only {virtualbox-iso.fedora|vmware-iso.fedora}] .

For example:
    
    packer build -force -var-file fedora-31-server-netinst-iso.pkrvars.hcl -only vmware-iso.fedora .

To convert VMware `.vmx` files to `.ova`:

    ovftool -overwrite input-vmx-path output-ova-path  


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Reference Information

To configure Fedora, we write Kickstart files for the Anaconda installer. The following references detail options and examples for writing Kickstart files.
* https://anaconda-installer.readthedocs.io
* https://fedoraproject.org/wiki/Anaconda
* https://fedoraproject.org/wiki/Anaconda/Logging
* https://anaconda-installer.readthedocs.io/en/latest/boot-options.html

The following link lists the currently supported releases for Fedora
* https://fedoraproject.org/wiki/Releases#Current_Supported_Releases

I get inspiration for my Packer scripts from the following GitHub repositories:
* https://github.com/boxcutter/fedora
* https://github.com/boxcutter/centos

There's also an [Awesome List][awesome-list] for Packer:
* https://github.com/dawitnida/awesome-packer

[awesome-list]: https://github.com/sindresorhus/awesome
