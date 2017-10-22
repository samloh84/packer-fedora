@echo off
SETLOCAL EnableDelayedExpansion

REM To force build, add -force to arguments
REM To build for only one builder, add -only=virtualbox-iso or -only=vmware-iso

SET NO_OPTS=1
SET FEDORA_26_SERVER=0
SET FEDORA_26_WORKSTATION=0
SET FEDORA_26_DEVELOPER_WORKSTATION=0
SET FEDORA_25_SERVER=0
SET FEDORA_25_WORKSTATION=0
SET FEDORA_25_DEVELOPER_WORKSTATION=0
SET FEDORA_24_SERVER=0
SET FEDORA_24_WORKSTATION=0
SET FEDORA_24_DEVELOPER_WORKSTATION=0
SET FEDORA_23_SERVER=0
SET FEDORA_23_WORKSTATION=0
SET FEDORA_23_DEVELOPER_WORKSTATION=0
SET ONLY_VMWARE_ISO=0
SET ONLY_VIRTUALBOX_ISO=0


SET BUILDER_ARGS=
SET ON_ERROR_ARGS=

:GETOPTS

ECHO "%~1"

SET OPTS_MATCHED=0
IF /I "%~1" == "all" (
	SET FEDORA_26_SERVER=1
	SET FEDORA_26_WORKSTATION=1
	SET FEDORA_26_DEVELOPER_WORKSTATION=1
	SET FEDORA_25_SERVER=1
	SET FEDORA_25_WORKSTATION=1
	SET FEDORA_25_DEVELOPER_WORKSTATION=1
	SET FEDORA_24_SERVER=1
	SET FEDORA_24_WORKSTATION=1
	SET FEDORA_24_DEVELOPER_WORKSTATION=1
	SET FEDORA_23_SERVER=1
	SET FEDORA_23_WORKSTATION=1
	SET FEDORA_23_DEVELOPER_WORKSTATION=1
	SET OPTS_MATCHED=1
)

IF /I "%~1" == "fedora-26" (
	SET FEDORA_26_SERVER=1
	SET FEDORA_26_WORKSTATION=1
	SET FEDORA_26_DEVELOPER_WORKSTATION=1
	SET OPTS_MATCHED=1
)

IF /I "%~1" == "fedora-25" (
	SET FEDORA_25_SERVER=1
	SET FEDORA_25_WORKSTATION=1
	SET FEDORA_25_DEVELOPER_WORKSTATION=1
	SET OPTS_MATCHED=1
)

IF /I "%~1" == "fedora-24" (
	SET FEDORA_24_SERVER=1
	SET FEDORA_24_WORKSTATION=1
	SET FEDORA_24_DEVELOPER_WORKSTATION=1
	SET OPTS_MATCHED=1
)

IF /I "%~1" == "fedora-23" (
	SET FEDORA_23_SERVER=1
	SET FEDORA_23_WORKSTATION=1
	SET FEDORA_23_DEVELOPER_WORKSTATION=1
	SET OPTS_MATCHED=1
)

IF /I "%~1" == "fedora-26-server" (
	SET FEDORA_26_SERVER=1
	SET OPTS_MATCHED=1
)

IF /I "%~1" == "fedora-26-workstation" (
	SET FEDORA_26_WORKSTATION=1
	SET OPTS_MATCHED=1
)

IF /I "%~1" == "fedora-26-developer-workstation" (
	SET FEDORA_26_DEVELOPER_WORKSTATION=1
	SET OPTS_MATCHED=1
)

IF /I "%~1" == "fedora-25-server" (
	SET FEDORA_25_SERVER=1
	SET OPTS_MATCHED=1
)

IF /I "%~1" == "fedora-25-workstation" (
	SET FEDORA_25_WORKSTATION=1
	SET OPTS_MATCHED=1
)

IF /I "%~1" == "fedora-25-developer-workstation" (
	SET FEDORA_25_DEVELOPER_WORKSTATION=1
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

IF /I "%~1" == "fedora-24-developer-workstation" (
	SET FEDORA_24_DEVELOPER_WORKSTATION=1
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

IF /I "%~1" == "fedora-23-developer-workstation" (
	SET FEDORA_23_DEVELOPER_WORKSTATION=1
	SET OPTS_MATCHED=1
)

IF /I "%~1" == "vmware-iso" (
	SET BUILDER_ARGS=-only=vmware-iso
	SET OPTS_MATCHED=1
)

IF /I "%~1" == "virtualbox-iso" (
	SET BUILDER_ARGS=-only=virtualbox-iso
	SET OPTS_MATCHED=1
)

IF /I "%~1" == "abort" (
	SET ON_ERROR_ARGS=-on-error=abort
	SET OPTS_MATCHED=1
)

SHIFT
IF %OPTS_MATCHED% EQU 1 (
    SET NO_OPTS=0
)

IF /I NOT "%~1" == "" GOTO GETOPTS

IF %NO_OPTS% EQU 1 (
	SET FEDORA_26_SERVER=1
    SET FEDORA_26_WORKSTATION=1
    SET FEDORA_26_DEVELOPER_WORKSTATION=1
	SET FEDORA_25_SERVER=1
    SET FEDORA_25_WORKSTATION=1
    SET FEDORA_25_DEVELOPER_WORKSTATION=1
	SET FEDORA_24_SERVER=1
    SET FEDORA_24_WORKSTATION=1
    SET FEDORA_24_DEVELOPER_WORKSTATION=1
    SET FEDORA_23_SERVER=1
    SET FEDORA_23_WORKSTATION=1
    SET FEDORA_23_DEVELOPER_WORKSTATION=1
)

IF %ONLY_VMWARE_ISO% EQU 1 (
    SET REST_ARGS=-only=vmware-iso
)

IF %ONLY_VIRTUALBOX_ISO% EQU 1 (
    SET REST_ARGS=-only=virtualbox-iso
)


echo NO_OPTS=%NO_OPTS%
echo REST_ARGS=%BUILDER_ARGS% %ON_ERROR_ARGS% 

echo FEDORA_26_SERVER=%FEDORA_26_SERVER%
echo FEDORA_26_WORKSTATION=%FEDORA_26_WORKSTATION%
echo FEDORA_26_DEVELOPER_WORKSTATION=%FEDORA_26_DEVELOPER_WORKSTATION%

echo FEDORA_25_SERVER=%FEDORA_25_SERVER%
echo FEDORA_25_WORKSTATION=%FEDORA_25_WORKSTATION%
echo FEDORA_25_DEVELOPER_WORKSTATION=%FEDORA_25_DEVELOPER_WORKSTATION%

echo FEDORA_24_SERVER=%FEDORA_24_SERVER%
echo FEDORA_24_WORKSTATION=%FEDORA_24_WORKSTATION%
echo FEDORA_24_DEVELOPER_WORKSTATION=%FEDORA_24_DEVELOPER_WORKSTATION%

echo FEDORA_23_SERVER=%FEDORA_23_SERVER%
echo FEDORA_23_WORKSTATION=%FEDORA_23_WORKSTATION%
echo FEDORA_23_DEVELOPER_WORKSTATION=%FEDORA_23_DEVELOPER_WORKSTATION%

SET LINUX_DISTRIBUTION=fedora
SET BUILD_TYPE=vmware-iso

pushd ..

IF %FEDORA_26_SERVER% EQU 1 (
    SET LINUX_DISTRIBUTION_VERSION=26
    SET INSTALL_TYPE=server
	packer.exe build -force -var-file=%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!.json %BUILDER_ARGS% %ON_ERROR_ARGS% fedora.json
	ovftool.exe --overwrite output\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!-%BUILD_TYPE%\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!.vmx output\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!.ova
)
IF %FEDORA_26_WORKSTATION% EQU 1 (
    SET LINUX_DISTRIBUTION_VERSION=26
    SET INSTALL_TYPE=workstation
	packer.exe build -force -var-file=%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!.json %BUILDER_ARGS% %ON_ERROR_ARGS% fedora.json
	ovftool.exe --overwrite output\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!-%BUILD_TYPE%\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!.vmx output\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!.ova
)
IF %FEDORA_26_DEVELOPER_WORKSTATION% EQU 1 (
    SET LINUX_DISTRIBUTION_VERSION=26
    SET INSTALL_TYPE=workstation
    packer.exe build -force -var-file=%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!.json %BUILDER_ARGS% %ON_ERROR_ARGS% fedora-developer.json
    ovftool.exe --overwrite output\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-developer-!INSTALL_TYPE!-%BUILD_TYPE%\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-developer-!INSTALL_TYPE!.vmx output\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-developer-!INSTALL_TYPE!.ova
)

IF %FEDORA_25_SERVER% EQU 1 (
    SET LINUX_DISTRIBUTION_VERSION=25
    SET INSTALL_TYPE=server
	packer.exe build -force -var-file=%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!.json %BUILDER_ARGS% %ON_ERROR_ARGS% fedora.json
	ovftool.exe --overwrite output\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!-%BUILD_TYPE%\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!.vmx output\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!.ova
)
IF %FEDORA_25_WORKSTATION% EQU 1 (
    SET LINUX_DISTRIBUTION_VERSION=25
    SET INSTALL_TYPE=workstation
	packer.exe build -force -var-file=%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!.json %BUILDER_ARGS% %ON_ERROR_ARGS% fedora.json
	ovftool.exe --overwrite output\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!-%BUILD_TYPE%\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!.vmx output\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!.ova
)
IF %FEDORA_25_DEVELOPER_WORKSTATION% EQU 1 (
    SET LINUX_DISTRIBUTION_VERSION=25
    SET INSTALL_TYPE=workstation
    packer.exe build -force -var-file=%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!.json %BUILDER_ARGS% %ON_ERROR_ARGS% fedora-developer.json
    ovftool.exe --overwrite output\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-developer-!INSTALL_TYPE!-%BUILD_TYPE%\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-developer-!INSTALL_TYPE!.vmx output\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-developer-!INSTALL_TYPE!.ova
)

IF %FEDORA_24_SERVER% EQU 1 (
    SET LINUX_DISTRIBUTION_VERSION=24
    SET INSTALL_TYPE=server
	packer.exe build -force -var-file=%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!.json %BUILDER_ARGS% %ON_ERROR_ARGS% fedora.json
	ovftool.exe --overwrite output\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!-%BUILD_TYPE%\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!.vmx output\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!.ova
)
IF %FEDORA_24_WORKSTATION% EQU 1 (
    SET LINUX_DISTRIBUTION_VERSION=24
    SET INSTALL_TYPE=workstation
	packer.exe build -force -var-file=%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!.json %BUILDER_ARGS% %ON_ERROR_ARGS% fedora.json
	ovftool.exe --overwrite output\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!-%BUILD_TYPE%\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!.vmx output\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!.ova
)
IF %FEDORA_24_DEVELOPER_WORKSTATION% EQU 1 (
    SET LINUX_DISTRIBUTION_VERSION=24
    SET INSTALL_TYPE=workstation
    packer.exe build -force -var-file=%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-developer-!INSTALL_TYPE!.json %BUILDER_ARGS% %ON_ERROR_ARGS% fedora.json
    ovftool.exe --overwrite output\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-developer-!INSTALL_TYPE!-%BUILD_TYPE%\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-developer-!INSTALL_TYPE!.vmx output\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-developer-!INSTALL_TYPE!.ova
)
IF %FEDORA_23_SERVER% EQU 1 (
    SET LINUX_DISTRIBUTION_VERSION=23
    SET INSTALL_TYPE=server
	packer.exe build -force -var-file=%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!.json %BUILDER_ARGS% %ON_ERROR_ARGS% fedora.json
	ovftool.exe --overwrite output\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!-%BUILD_TYPE%\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!.vmx output\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!.ova
)
IF %FEDORA_23_WORKSTATION% EQU 1 (
    SET LINUX_DISTRIBUTION_VERSION=23
    SET INSTALL_TYPE=workstation
	packer.exe build -force -var-file=%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!.json %BUILDER_ARGS% %ON_ERROR_ARGS% fedora.json
	ovftool.exe --overwrite output\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!-%BUILD_TYPE%\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!.vmx output\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!.ova
)
IF %FEDORA_23_DEVELOPER_WORKSTATION% EQU 1 (
    SET LINUX_DISTRIBUTION_VERSION=23
    SET INSTALL_TYPE=workstation
    packer.exe build -force -var-file=%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-!INSTALL_TYPE!.json %BUILDER_ARGS% %ON_ERROR_ARGS% fedora-developer.json
    ovftool.exe --overwrite output\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-developer-!INSTALL_TYPE!-%BUILD_TYPE%\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-developer-!INSTALL_TYPE!.vmx output\%LINUX_DISTRIBUTION%-!LINUX_DISTRIBUTION_VERSION!-developer-!INSTALL_TYPE!.ova
)

popd
