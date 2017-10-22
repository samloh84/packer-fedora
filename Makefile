
.PHONY: all fedora-26 fedora-25 fedora-24 fedora-23

fedora-26: fedora-26-server fedora-26-workstation fedora-26-developer-workstation

fedora-26-server: fedora.json fedora-26-server.json floppy/fedora-26-server/anaconda-ks.json
	packer -force -var-file=fedora-26-server.json fedora.json

fedora-26-workstation: fedora.json fedora-26-workstation.json floppy/fedora-26-workstation/anaconda-ks.json
	packer -force -var-file=fedora-26-workstation.json fedora.json

fedora-26-developer-workstation: fedora.json fedora-26-workstation.json floppy/fedora-26-workstation.json/anaconda-ks.json
	packer -force -var-file=fedora-26-workstation.json fedora-developer.json

fedora-25: fedora-25-server fedora-25-workstation fedora-25-developer-workstation

fedora-25-server: fedora.json fedora-25-server.json floppy/fedora-25-server/anaconda-ks.json
	packer -force -var-file=fedora-25-server.json fedora.json

fedora-25-workstation: fedora.json fedora-25-workstation.json floppy/fedora-25-workstation/anaconda-ks.json
	packer -force -var-file=fedora-25-workstation.json fedora.json

fedora-25-developer-workstation: fedora.json fedora-25-workstation.json floppy/fedora-25-workstation.json/anaconda-ks.json
	packer -force -var-file=fedora-25-workstation.json fedora-developer.json

fedora-24: fedora-24-server fedora-24-workstation fedora-24-developer-workstation

fedora-24-server: fedora.json fedora-24-server.json floppy/fedora-24-server/anaconda-ks.json
	packer -force -var-file=fedora-24-server.json fedora.json

fedora-24-workstation: fedora.json fedora-24-workstation.json floppy/fedora-24-workstation/anaconda-ks.json
	packer -force -var-file=fedora-24-workstation.json fedora.json

fedora-24-developer-workstation: fedora.json fedora-24-workstation.json floppy/fedora-24-workstation.json/anaconda-ks.json
	packer -force -var-file=fedora-24-workstation.json fedora-developer.json

fedora-23: fedora-23-server fedora-23-workstation fedora-23-developer-workstation

fedora-23-server: fedora.json fedora-23-server.json floppy/fedora-23-server/anaconda-ks.json
	packer -force -var-file=fedora-23-server.json fedora.json

fedora-23-workstation: fedora.json fedora-23-workstation.json floppy/fedora-23-workstation/anaconda-ks.json
	packer -force -var-file=fedora-23-workstation.json fedora.json

fedora-23-developer-workstation: fedora.json fedora-23-workstation.json floppy/fedora-23-workstation.json/anaconda-ks.json
	packer -force -var-file=fedora-23-workstation.json fedora-developer.json
