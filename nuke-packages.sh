#!/bin/bash
#
# Why not equivs?
#	Equivs cannot create multiple packages.
#	WTF WHY?  It's completely unuable due to this.

HERE="$(readlink -e .)" || exit

cd "$1" || exit
shift

TMP="$(mktemp -d BUILD.XXXXX)" || exit
TMP="$(readlink -e "$TMP")" || exit
trap 'rm -rf "$TMP"' 0

mkdir "$TMP/debian" || exit
cp -r "$HERE"/template/. "$TMP/debian/" || exit

{ cd "$HERE" && cat "$@"; } |
while read -r package ign
do
	case "$package" in
	('')		continue;;
	(\#*)		continue;;
	esac
	echo package "$package" >&2
	cat <<EOF || exit

Package: $package
Architecture: all
Multi-Arch: foreign
Description: Dummy $package
 $package is a dummy here
EOF
done >> "$TMP/debian/control" || exit

find "$TMP" -print0 | xargs --null -- touch -d '1970-01-01 00:00:00 +0000' --
echo building .. >&2

cd "$TMP" && dpkg-buildpackage --unsigned-changes --unsigned-source --no-check-builddeps

