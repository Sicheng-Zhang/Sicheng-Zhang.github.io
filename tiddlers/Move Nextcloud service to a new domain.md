<br><br>

1. Get the new domain name to replace the old one (e.g.  move from `yyy.com` to `zzz.com`).

2. Setup DNA records on the domain provider. Point the hostname to the IP address of virtual server.  (e.g.  figure below shows the setting for Digital Ocean)

	<a href="https://westerlies.us/index.php/s/yLcsxwJ6FNYYi4L/preview
" target="_blank" rel="noopener noreferrer" class="center"><img src="https://westerlies.us/index.php/s/yLcsxwJ6FNYYi4L/preview
" alt="WESTERLIES" width="450"></a>

3. ssh to the virtual server. Setup the new domain, disable HTTPS, remove `certs` files.

	```bash
	sudo nextcloud.occ config:system:set trusted_domains 1 --value=zzz.com
	sudo nextcloud.disable-https
	sudo rm -rf /var/snap/nextcloud/current/certs
	```

4. Install `certbot` and update `certs` files.

	```bash
	sudo snap install certbot
	cd /var/snap/nextcloud/current
	sudo mkdir certs
	sudo cp -a /snap/certbot/current/. /var/snap/nextcloud/current/certs/certbot/
	```

5. Update Let's Encrypt for the new domain.

	```bash
	sudo snap remove certbot
	sudo ufw allow 80,443/tcp
	sudo nextcloud.enable-https lets-	encrypt
	```

4. Wait until the new domain presents a Nextcloud login page.

	<a href="https://westerlies.us/index.php/s/caeyMF79qGyRXja/preview
" target="_blank" rel="noopener noreferrer" class="center"><img src="https://westerlies.us/index.php/s/caeyMF79qGyRXja/preview
" alt="WESTERLIES" width="450"></a>
