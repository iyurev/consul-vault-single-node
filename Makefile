vault:
	cp vault.service  /etc/systemd/system/ && systemctl daemon-reload	

consul:
	cp consul.service  /etc/systemd/system/  && systemctl daemon-reload

	
