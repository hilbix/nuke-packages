# Dummy Package Generator

This creates dummy packages from file `PACKAGE-TO-NUKE.txt`.

- It has the format of output of `dpkg --get-selections`

Purpose: Remove packages which you cannot remove without tearing down 99% of your system.

The `ubuntu-advantage` PITA already is predefined.


## Usage

	git clone https://github.com/hilbix/dummy-package.git
	cd dummy-package
	dpkg --get-selections | grep unwanted-package > PACKAGE-TO-NUKE.txt
	make
	sudo dpkg -i build/*.deb

and eventually:

	sudo apt auto-remove --purge
	sudo debfoster


## FAQ

WTF why?

- Because `equivs` is not good in creating hundreds of unwanted packages

License?

- Free as free beer, free speech, free baby

License of generated package?

- Free as free beer, free speech, free baby

