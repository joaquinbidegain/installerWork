wmic process where "commandline like '%%HubLauncher%%' and name like '%%java%%'" delete
wmic process where "commandline like '%%hub%%' and name like '%%java%%'" delete