@echo off
REM To force build, add -force to arguments
REM To build for only one builder, add -only=virtualbox-iso or -only=vmware-iso

SET FEDORA24SERVER=0
SET FEDORA24WORKSTATION=0
SET FEDORA23SERVER=0
SET FEDORA23WORKSTATION=0

echo Building %1
IF [%1] == [] SET FEDORA24SERVER=1
IF [%1] == [] SET FEDORA24WORKSTATION=1
IF [%1] == [] SET FEDORA23SERVER=1
IF [%1] == [] SET FEDORA23WORKSTATION=1

IF "%1" == "all" SET FEDORA24SERVER=1
IF "%1" == "all" SET FEDORA24WORKSTATION=1
IF "%1" == "all" SET FEDORA23SERVER=1
IF "%1" == "all" SET FEDORA23WORKSTATION=1

IF "%1" == "fedora-24" SET FEDORA24SERVER=1
IF "%1" == "fedora-24" SET FEDORA24WORKSTATION=1
IF "%1" == "fedora-23" SET FEDORA23SERVER=1
IF "%1" == "fedora-23" SET FEDORA23WORKSTATION=1

IF "%1" == "fedora-24-server" SET FEDORA24SERVER=1
IF "%1" == "fedora-24-workstation" SET FEDORA24WORKSTATION=1
IF "%1" == "fedora-23-server" SET FEDORA23SERVER=1
IF "%1" == "fedora-23-workstation" SET FEDORA23WORKSTATION=1

set RESTVAR=
shift
:loop1
if [%1] == [] goto after_loop
set RESTVAR=%RESTVAR% %1
shift
goto loop1

:after_loop

pushd ..
IF %FEDORA24SERVER% EQU 1 packer.exe build -var-file=fedora-24-server.json %RESTVAR% fedora.json
IF %FEDORA24WORKSTATION% EQU 1 packer.exe build -var-file=fedora-24-workstation.json %RESTVAR% fedora.json
IF %FEDORA23SERVER% EQU 1 packer.exe build -var-file=fedora-23-server.json %RESTVAR% fedora.json
IF %FEDORA23WORKSTATION% EQU 1 packer.exe build -var-file=fedora-23-workstation.json %RESTVAR% fedora.json
popd
