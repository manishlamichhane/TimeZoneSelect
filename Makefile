install: timezoneselect_ui.sh.mo
	install timezoneselect.sh timezoneselect_ui.sh /usr/local/bin
	grep -q "`cat timezoneselect.services`" /etc/services || cat timezoneselect.services >> /etc/services
	install timezoneselect.xinetd /etc/xinetd.d/timezoneselect.sh
	ln -s /usr/local/bin/timezoneselect_ui.sh /usr/local/bin/ntimezoneselect_ui.sh
	install timezoneselect_ui.sh.mo /usr/share/locale/fr_FR/LC_MESSAGES/timezoneselect_ui.sh.mo
	
uninstall:
	rm /usr/local/bin/timezoneselect_ui.sh
	rm /usr/local/bin/timezoneselect.sh
	rm /usr/local/bin/ntimezoneselect_ui.sh
	rm /usr/share/locale/fr_FR/LC_MESSAGES/timezoneselect_ui.sh.mo
	locale-gen
	


clone:
	git clone https://github.com/SheepOnMeth/TimeZoneSelect

download:
	git pull

upload:
	git add -A
	git commit
	git push origin 

tags:
	git push origin --tags
