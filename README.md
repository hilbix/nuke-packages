# Dummy Package Generator

This creates dummy packages from file `PACKAGE-TO-NUKE.txt`.

- It has the format of output of `dpkg --get-selections`

Purpose: Remove packages which you cannot remove without tearing down 99% of your system.

The `ubuntu-advantage` PITA already is predefined.


## Usage

> You need
>
>	sudo apt install debhelper build-essential
>
> Recommended:
>
>	sudo apt install etckeeper debfoster

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

Reproducible?

- I tried my best but failed miserably.
- [I do not understand any bit of the HowTo](https://wiki.debian.org/ReproducibleBuilds/Howto)
- Perhaps anybody can enlighten me with a step-by-step guide how to reproducibly build some minimal dummy Debian package
  - Starting with a minimal Debian install?
  - With each an every command required to get it from minimal to build the dummy in a reproducible way?
  - Just the in-sequence list of all the commands for just some arbitrary single example suffice.  I need no script.  I need no options.

