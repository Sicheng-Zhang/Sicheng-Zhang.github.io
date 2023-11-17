<br><br>

1. Meet the prerequisites:
	+ A virtual server running Linux (e.g. Ubuntu server with IP address `xxx.xxx.xxx.xxx`)
	+ A domain name (e.g. `yyy.com`)
	
2. ssh to the virtual server, make sure that `host` is a sudo user.

	```bash
	ssh host@xxx.xxx.xxx.xxx
	```
	
3. Setup the firewall.

	```bash
	ufw allow OpenSSH
	ufw enable
	```

4. Install Nextcloud and create a account (e.g. account `user1` with password `password123`).

	```bash
	sudo snap install nextcloud
	sudo nextcloud.manual-install user1 password123
	```

5. Setup the domain on the server.

	```bash
	sudo nextcloud.occ config:system:set trusted_domains 1 --value=yyy.com
	sudo ufw allow 80,443/tcp
	```
	
6. Setup Let’s Encrypt for SSL/TLS certificates.

	```bash
	sudo nextcloud.enable-https lets-encrypt
	```
	
7. Setup DNA records on the domain provider. Point the hostname to the IP address of virtual server. (e.g.  figure below shows the setting for Digital Ocean)

	<a href="https://ucarecdn.com/c8c49305-e075-4461-91ed-88360585faa5/image_23573983.png
" target="_blank" rel="noopener noreferrer" class="center"><img src="https://ucarecdn.com/c8c49305-e075-4461-91ed-88360585faa5/image_23573983.png
" alt="WESTERLIES" width="450"></a>

8. Wait until the domain presents a Nextcloud login page. Login with `user1` and `password123`.

	<a href="https://ucarecdn.com/56187205-e856-4b8d-a675-392e6a9ada73/image_836734945.png
" target="_blank" rel="noopener noreferrer" class="center"><img src="https://ucarecdn.com/56187205-e856-4b8d-a675-392e6a9ada73/-/preview/600x600/-/quality/smart_retina/-/format/auto/
" alt="WESTERLIES" width="450"></a>
