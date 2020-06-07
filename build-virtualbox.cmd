@echo off

if "%~f1" == "" (
    for /f %%G in ('dir /B /O:-N *.pkrvars.hcl ^| findstr "fedora-"') do (
        CALL :packer_build "%%G"
    )
) else (
    CALL :packer_build "%~f1"
)

GOTO :eof

:packer_build
echo ============================================================
echo Building %*
echo ============================================================
echo:

packer build -force -var-file "%*" -only="virtualbox-iso.fedora" .
EXIT /B %ERRORLEVEL%
