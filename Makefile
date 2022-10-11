#

love:	all

all:	build/.done

build/.done:	Makefile nuke-packages.sh PACKAGES-TO-NUKE.txt
	-mkdir build 2>/dev/null
	touch build/.done
	./nuke-packages.sh build PACKAGES-TO-NUKE.txt

clean:
	rm -rf build

