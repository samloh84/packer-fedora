for /f %%G in ('dir /b *.pkrvars.hcl ^| findstr "fedora-"') do packer build -force -var-file "%%G" -only="virtualbox-iso.fedora" .
