all-stow: rclone-stow toh-zfs-stow brave-stow
	sudo stow --adopt -v --target=/ */

all-unstow: rclone-unstow toh-zfs-unstow brave-unstow
	sudo stow -D -v --target=/ */

rclone-stow:
	sudo stow -v --target=/ rclone
	cd rclone && make systemd-restart && make start-all

rclone-unstow:
	cd rclone && make stop-all
	sudo stow -D -v --target=/ rclone

toh-zfs-stow:
	sudo stow -v --target=/ toh-zfs

toh-zfs-unstow:
	sudo stow -D -v --target=/ toh-zfs

brave-stow: # brave desktop icon for gnome that enables touchpad gestures. Dont
	# don't forget to set brave://flags prefered ozone platform to wayland.
	sudo stow -v --target=/ brave

brave-unstow:
	sudo stow -D -v --target=/ brave

brave-fix:
	sudo rm /usr/share/applications/brave-browser.desktop
	sudo stow -v --target=/ brave

keyboard:
	sudo rm /usr/local/bin/toggle-internal-keyboard.sh
	sudo rm /etc/polkit-1/rules.d/49-toggle-internal-keyboard.rules
	sudo rm /etc/udev/rules.d/80-toggle-internal-keyboard.rules
	sudo stow -v --target=/ inhibit-internal-keyboard
