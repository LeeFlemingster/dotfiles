#!/bin/bash
# https://github.com/rclone/rclone/wiki/Systemd-rclone-mount#systemd

all: config systemd box dropbox google proton


config:
	rclone config

box:
	mkdir -p ~/Remote/Box
	systemctl --user enable --now rclone@Box

dropbox:
	mkdir -p ~/Remote/Dropbox
	systemctl --user enable --now rclone@Dropbox

google:
	mkdir -p ~/Remote/GoogleDrive
	systemctl --user enable --now rclone@GoogleDrive
	mkdir -p ~/Remote/GooglePhotos
	systemctl --user enable --now rclone@GooglePhotos

proton:
	mkdir -p ~/Remote/ProtonDrive
	systemctl --user enable --now rclone@ProtonDrive
