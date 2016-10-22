
.PHONY: all fedora-23 fedora-23-server fedora-23-workstation fedora-24 fedora-24-server fedora-24-workstation

fedora-24: fedora-24-server fedora-24-workstation

fedora-24-server: fedora.json fedora-24-server.json
	packer -var-file=fedora-24-server.json fedora.json

fedora-24-workstation: fedora.json fedora-24-workstation.json
	packer -var-file=fedora-24-workstation.json fedora.json

fedora-23: fedora-23-server fedora-23-workstation

fedora-23-workstation: fedora.json fedora-23-workstation.json
	packer -var-file=fedora-23-workstation.json fedora.json

fedora-23-workstation: fedora.json fedora-23-workstation.json
	packer -var-file=fedora-23-workstation.json fedora.json


