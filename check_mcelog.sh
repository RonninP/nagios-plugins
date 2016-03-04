#!/bin/bash
 
LOGFILE=/var/log/mcelog
 
if [ ! -f "$LOGFILE" ]
then
    echo "No logfile exists"
    exit 3
else
    ERRORS=$( grep -c "HARDWARE ERROR" /var/log/mcelog )
    if [ $ERRORS -eq 0 ]
    then
        echo "OK: $ERRORS hardware errors found"
        exit 0
    elif [ $ERRORS -gt 0 ]
    then
        echo "WARNING: $ERRORS hardware errors found"
        exit 1
    fi
fi
