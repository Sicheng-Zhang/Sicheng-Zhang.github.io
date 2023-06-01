<br><br>

1. Update the current Fedora release.
	```bash
	sudo dnf upgrade --refresh
	```

2. Update the system plugins.
	```bash
	sudo dnf install dnf-plugin-system-upgrade
	```
	
3. Download the new Fedora release (e.g. Fedora 37).
	```bash
	sudo dnf system-upgrade download --releasever=37
	```

4. Reboot to upgrade the system.
	```bash
	sudo dnf system-upgrade reboot
	```

5. Install `uming` and `ukai` fonts to display CJK characters.
	```bash
	sudo dnf install cjkuni-ukai-fonts cjkuni-uming-fonts
	```

6. Modify or create the config file at `/et/fonts/local.conf`. Use the content from [local.conf](https://github.com/zma/config_files/blob/master/others/local.conf).

7. **Tip**: To better rendering Japanese characters, install `Google Noto` fonts.
