#!/bin/bash

TIMEZONESELECT=timezoneselect.sh
HOST=localhost
PORT=1234

FILE1=/tmp/timezoneselect-$$
FILE2=/tmp/timezoneselect-$$


GETTEXT="gettext -d timezoneselect_ui.sh"

which gdialog 2> /dev/null && DIALOG=gdialog || DIALOG=dialog

help () {
        echo "Usage: $0 [ host [port] | --help ]"
}

end () {
	rm -f $FILE1 $FILE2 $ERROR
	exit
}

if [ $# -eq 1 ]
then
        if [ $1 -eq '--help' ]
        then
                help
                exit -1
        else
                HOST=$1
        fi
elif [ $# -eq 2 ]
then
        PORT=$2
fi

if [ $# -ge 1 -o `basename $0` = 'ntimezoneselect_ui' ]
then
	if [ $HOST -a $PORT ]
	then
	        TIMEZONESELECT="nc $HOST $PORT"
	else
		echo "You must set HOST and PORT"
		exit -2
	fi
fi

while true
do
	$DIALOG --inputbox "`$GETTEXT \"Enter Continent and City:\"`" 8 55 2> $FILE1 || end
	
	
	echo "FILE1 TIMEZONESELECT"
	cat $FILE1 | $TIMEZONESELECT
	
	
	echo "FILE2"
	cat $FILE2
	
	if cat $FILE1 | $TIMEZONESELECT > $FILE2 
	then
		#MSG="`$GETTEXT \"Time:\"` `cat $FILE2`\\n\\n`$GETTEXT \"Continue?\"`"
		#$DIALOG --yesno "$MSG" 7 20 || end
		cat $FILE2
	else
		MSG="`$GETTEXT \"Error:\"`\\n\\n`cat $ERROR`\\n\\n`$GETTEXT \"Continue?\"`"
		$DIALOG --yesno "$MSG" 10 35 || end
	fi
done
