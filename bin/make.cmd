REM To force build, add -force to arguments
REM To build for only one builder, add -only=virtualbox-iso or -only=vmware-iso
pushd ..
packer.exe build -var-file=fedora-24-server.json %* fedora.json
packer.exe build -var-file=fedora-24-workstation.json %* fedora.json
packer.exe build -var-file=fedora-23-server.json %* fedora.json
packer.exe build -var-file=fedora-23-workstation.json %* fedora.json
popd
