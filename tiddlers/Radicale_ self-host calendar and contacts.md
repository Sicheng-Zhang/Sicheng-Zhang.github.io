<br><br>

1. Install Radicale using `pip`
	```bash
	python3 -m pip install --upgrade radicale
	```
2. Create configuration files for Radicale
	```bash
	mkdir ~/.config/radicale
	touch ~/.config/radicale/config
	touch ~/.config/radicale/users
	```
3. Install Apache `htpasswd`, then create a user and a password 
	```bash
	sudo apt-get install apache2-utils #For Debian-based
	htpasswd -c ~/.config/radicale/users user1
	```
4. Update the `config` file with the following content
	```txt
	[server]
	# Bind all addresses
	hosts = 0.0.0.0:5232, [::]:5232

	[auth]
	type = htpasswd
	htpasswd_filename = ~/.config/radicale/users
	htpasswd_encryption = md5

	[storage]
	filesystem_folder = ~/.var/lib/radicale/collections
	```
5. Create Radicale service with `systemd`
	```bash
	touch ~/.config/systemd/user/radicale.service
	```
6. Update the file `radicale.service` with the following content
	```bash
	[Unit]
	Description=Radicale server

	[Service]
	ExecStart=/usr/bin/env python3 -m radicale
	Restart=on-failure

	[Install]
	WantedBy=default.target
	```
7. Start the Radicale server
	```bash
	systemctl --user enable radicale
	systemctl --user start radicale
	systemctl --user status radicale
	```
8. **Optional:** Import existing calendar and contacts (for user1)
	```bash
	curl -u 'user1:password' -X PUT http://localhost:5232/user1/calendar --data-binary @calendar.ics
	curl -u 'user1:password' -X PUT http://localhost:5232/user1/addressbook --data-binary @contact.vcf
	```

<br>

**Note**:
- When importing existing contacts (`vcf` file), make sure that every record contains `FN:`. If not, radicale returns "Bad request" error message.

<br>

**Next steps**:
- Setup Apache configuration or nginx configuration for the Radicale service.
- Add calendar and contacts to clients using Radicale CalDav and CardDav.
