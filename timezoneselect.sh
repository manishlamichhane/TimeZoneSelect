#!/bin/sh

FILE=/tmp/timezoneselect-$$
read EXPR

echo TZ=$EXPR date > $FILE

sh $FILE
EXIT_STATUS=$?
rm -f $FILE
exit $EXIT_STATUS
