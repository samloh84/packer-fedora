@echo off

REM To force build, add -force to arguments
REM To build for only one builder, add -only=virtualbox-iso or -only=vmware-iso

SET NO_OPTS=1

SET FEDORA_24_SERVER=0
SET FEDORA_24_WORKSTATION=0
SET FEDORA_23_SERVER=0
SET FEDORA_23_WORKSTATION=0
SET ONLY_VMWARE_ISO=0
SET ONLY_VIRTUALBOX_ISO=0


SET REST_ARGS=

:GETOPTS

ECHO "%~1"

SET OPTS_MATCHED=0
IF /I "%~1" == "all" (
	SET FEDORA_24_SERVER=1
	SET FEDORA_24_WORKSTATION=1
	SET FEDORA_23_SERVER=1
	SET FEDORA_23_WORKSTATION=1
	SET FEDORA_5_SERVER=1
	SET FEDORA_5_WORKSTATION=1
	SET OPTS_MATCHED=1
)

IF /I "%~1" == "fedora-24" (
	SET FEDORA_24_SERVER=1
	SET FEDORA_24_WORKSTATION=1
	SET OPTS_MATCHED=1
)

IF /I "%~1" == "fedora-23" (
	SET FEDORA_23_SERVER=1
	SET FEDORA_23_WORKSTATION=1
	SET OPTS_MATCHED=1
)

IF /I "%~1" == "fedora-24-server" (
	SET FEDORA_24_SERVER=1
	SET OPTS_MATCHED=1
)

IF /I "%~1" == "fedora-24-workstation" (
	SET FEDORA_24_WORKSTATION=1
	SET OPTS_MATCHED=1
)

IF /I "%~1" == "fedora-23-server" (
	SET FEDORA_23_SERVER=1
	SET OPTS_MATCHED=1
)

IF /I "%~1" == "fedora-23-workstation" (
	SET FEDORA_23_WORKSTATION=1
	SET OPTS_MATCHED=1
)

IF /I "%~1" == "vmware-iso" (
	SET ONLY_VMWARE_ISO=1
	SET OPTS_MATCHED=1
)

IF /I "%~1" == "virtualbox-iso" (
	SET ONLY_VIRTUALBOX_ISO=1
	SET OPTS_MATCHED=1
)


SHIFT
IF %OPTS_MATCHED% EQU 1 (
    SET NO_OPTS=0
)

IF /I NOT "%~1" == "" GOTO GETOPTS

IF %NO_OPTS% EQU 1 (
	SET FEDORA_24_SERVER=1
    SET FEDORA_24_WORKSTATION=1
    SET FEDORA_23_SERVER=1
    SET FEDORA_23_WORKSTATION=1
)

IF %ONLY_VMWARE_ISO% EQU 1 (
    SET REST_ARGS=-only=vmware-iso
)

IF %ONLY_VIRTUALBOX_ISO% EQU 1 (
    SET REST_ARGS=-only=virtualbox-iso
)


echo NO_OPTS=%NO_OPTS%
echo REST_ARGS=%REST_ARGS%

echo FEDORA_24_SERVER=%FEDORA_24_SERVER%
echo FEDORA_24_WORKSTATION=%FEDORA_24_WORKSTATION%

echo FEDORA_23_SERVER=%FEDORA_23_SERVER%
echo FEDORA_23_WORKSTATION=%FEDORA_23_WORKSTATION%

pushd ..
IF %FEDORA_24_SERVER% EQU 1 (
	packer.exe build -force -var-file=fedora-24-server.json %REST_ARGS% fedora.json
	ovftool.exe --overwrite output\vmware-iso\fedora-24-server\fedora-24-server.vmx output\fedora-24-server.ova
)
IF %FEDORA_24_WORKSTATION% EQU 1 (
	packer.exe build -force -var-file=fedora-24-workstation.json %REST_ARGS% fedora.json
	ovftool.exe --overwrite output\vmware-iso\fedora-24-workstation\fedora-24-workstation.vmx output\fedora-24-workstation.ova
)

IF %FEDORA_23_SERVER% EQU 1 (
	packer.exe build -force -var-file=fedora-23-server.json %REST_ARGS% fedora.json
	ovftool.exe --overwrite output\vmware-iso\fedora-23-server\fedora-23-server.vmx output\fedora-23-server.ova
)
IF %FEDORA_23_WORKSTATION% EQU 1 (
	packer.exe build -force -var-file=fedora-23-workstation.json %REST_ARGS% fedora.json
	ovftool.exe --overwrite output\vmware-iso\fedora-23-workstation\fedora-23-workstation.vmx output\fedora-23-workstation.ova
)

popd
