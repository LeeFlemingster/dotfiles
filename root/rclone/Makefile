#!/bin/bash
# https://github.com/rclone/rclone/wiki/Systemd-rclone-mount#systemd

all: config systemd-restart box dropbox google proton

systemd-restart:
	systemctl --user daemon-reload

stop-all: # Stop all network drives
	systemctl  --user disable --now rclone@Box
	systemctl  --user disable --now rclone@Dropbox
	systemctl  --user disable --now rclone@GoogleDrive
	systemctl  --user disable --now rclone@GooglePhotos
	systemctl  --user disable --now rclone@ProtonDrive

start-all: box dropbox google proton # Stop all network drives

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
