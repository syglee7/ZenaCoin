
Debian
====================
This directory contains files used to package zenacoind/zenacoin-qt
for Debian-based Linux systems. If you compile zenacoind/zenacoin-qt yourself, there are some useful files here.

## zenacoin: URI support ##


zenacoin-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install zenacoin-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your zenacoin-qt binary to `/usr/bin`
and the `../../share/pixmaps/zenacoin128.png` to `/usr/share/pixmaps`

zenacoin-qt.protocol (KDE)

