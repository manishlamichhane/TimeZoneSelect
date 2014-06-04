#!/bin/bash

TIMEZONESELECT=timezoneselect.sh
HOST=localhost
PORT=1234

FILE1=/tmp/timezoneselect-$$


GETTEXT="gettext -d timezoneselect_ui.sh"

DIALOG=gdialog

help () {
        echo "Usage: $0 [ host [port] | --help ]"
}

end () {
	rm -f $FILE1
	exit
}


# Test for argument help
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

# Use of netcat and test for link to timezoneselect_ui
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

#Loop for asking the Continent/City and displaying the result
while true
do
	$DIALOG --inputbox "`$GETTEXT \"Enter ( Continent / City ) :\"`" 8 25 2> $FILE1 || end
	
	
	export TZ=`cat $FILE1`
	
	MSG="`$GETTEXT \"Time :\"` `echo $TZ | $TIMEZONESELECT`\\n\\n`$GETTEXT \"Continue?\"`"
	$DIALOG --yesno "$MSG" 7 20 || end
	
	
done
