#!/bin/bash

RANGE="$1"
PHONE="$2"
echo -n "$RANGE" | grep -qE "^[0-9a-fA-F]{4}$"
if [ ! $? -eq 0 ] ; then
    echo "not a valid range"
    exit 1
fi

if [ "x$PHONE" == "x" ]; then
    echo "please specify a phone"
    exit 1
fi

RANGE_HEX="$(echo $RANGE | sed -re 's,([0-9a-fA-F]{2})([0-9a-fA-F]{2}),\\x\1\\x\2,g')"

DATA="\x00\x02${RANGE_HEX}"
echo -e "$DATA" | nc -U /tmp/osmocom_mi_$PHONE


