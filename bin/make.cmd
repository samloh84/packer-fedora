REM To force build, add -force to arguments

pushd ..
packer.exe build -var-file=centos-7-workstation.json %* centos.json
packer.exe build -var-file=centos-7-server.json %* centos.json

ovftool.exe output\centos-7-server\vmware-iso\centos-7-server.vmx output\centos-7-server.vmware.ova
ovftool.exe output\centos-7-workstation\vmware-iso\centos-7-workstation.vmx output\centos-7-workstation.vmware.ova

popd
