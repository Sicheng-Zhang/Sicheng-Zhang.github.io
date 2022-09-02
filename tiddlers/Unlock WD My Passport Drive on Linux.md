<br><br>

1. Download the Passport Drive utility [`wdpassport-utils`]( https://raw.githubusercontent.com/evox95/wdpassport-utils/master/wdpassport-utils.py). 

2. Install packages `python-devel` and `lsscsi` using the package management.

3. Install python library `py_sg`  using `pip`:

	```bash
	sudo pip3 install --user git+https://github.com/crypto-universe/py_sg
	```

4. Get the drive name, check the line `[xxx] Attached SCSI disk` above the WD My Passport Drive.

	```bash
	dmesg | grep -i scsi
	```

5. Mount the drive and enter the password.

	```bash
	sudo ~/wdpassport-utils.py -u --device /dev/xxx
	```