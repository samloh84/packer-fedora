@echo off

REM To force build, add -force to arguments
REM To build for only one builder, add -only=virtualbox-iso or -only=vmware-iso

SET NO_OPTS=1

SET FEDORA_24_SERVER=0
SET FEDORA_24_WORKSTATION=0
SET FEDORA_23_SERVER=0
SET FEDORA_23_WORKSTATION=0

SET REST_ARGS=

:GETOPTS
SET OPTS_MATCHED=0
IF "%1" == "all" (
	SET FEDORA_24_SERVER=1
	SET FEDORA_24_WORKSTATION=1
	SET FEDORA_23_SERVER=1
	SET FEDORA_23_WORKSTATION=1
)

IF "%1" == "fedora-24" (
	SET FEDORA_24_SERVER=1
	SET FEDORA_24_WORKSTATION=1
)

IF "%1" == "fedora-23" (
	SET FEDORA_23_SERVER=1
	SET FEDORA_23_WORKSTATION=1
)

IF "%1" == "fedora-24-server" (
	SET FEDORA_24_SERVER=1
)

IF "%1" == "fedora-24-workstation" (
	SET FEDORA_24_WORKSTATION=1
)

IF "%1" == "fedora-23-server" (
	SET FEDORA_23_SERVER=1
)

IF "%1" == "fedora-23-workstation" (
	SET FEDORA_23_WORKSTATION=1
)

SHIFT
IF OPTS_MATCHED EQU 0 SET REST_ARGS=%REST_ARGS% %1
IF NOT "%1" == "" GOTO GETOPTS

IF NO_OPTS EQU 1 (
	SET FEDORA_24_SERVER=1
    SET FEDORA_24_WORKSTATION=1
    SET FEDORA_23_SERVER=1
    SET FEDORA_23_WORKSTATION=1
)


pushd ..
IF FEDORA_24_SERVER EQU 1 (
	packer.exe build -var-file=fedora-24-server.json %REST_ARGS% fedora.json
	ovftool.exe --overwrite output\vmware-iso\fedora-24-server\fedora-24-server.vmx output\fedora-24-server.ova
)
IF FEDORA_24_WORKSTATION EQU 1 (
	packer.exe build -var-file=fedora-24-workstation.json %REST_ARGS% fedora.json
	ovftool.exe --overwrite output\vmware-iso\fedora-24-workstation\fedora-24-workstation.vmx output\fedora-24-workstation.ova
)

IF FEDORA_23_SERVER EQU 1 (
	packer.exe build -var-file=fedora-23-server.json %REST_ARGS% fedora.json
	ovftool.exe --overwrite output\vmware-iso\fedora-23-server\fedora-23-server.vmx output\fedora-23-server.ova
)
IF FEDORA_23_WORKSTATION EQU 1 (
	packer.exe build -var-file=fedora-23-workstation.json %REST_ARGS% fedora.json
	ovftool.exe --overwrite output\vmware-iso\fedora-23-workstation\fedora-23-workstation.vmx output\fedora-23-workstation.ova
)

popd
