TimeZoneSelect
=====================

**Dependencies :**

 - bash
 - gdialog
 - gettext
 - netcat
 - xinetd



This program allows the user to obtain the time of different timezone. It is base 
on a client / server model. This software only has a default translation in english 
and one in french.


Install
--------
      su -
      make install


Use CLI
--------
      $ timezoneselect.sh 
      Europe/Paris
      mar. juin  3 14:54:02 CEST 2014


Use GUI
--------
      $ timezoneselect_ui.sh 
 Follow the instruction on the screen. The continent and the city need to be input this way : Europe/Paris. If not, It will not work.
