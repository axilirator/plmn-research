#!/bin/bash

TMSI="$1"

echo -n "$TMSI" | grep -qE "^[0-9a-fA-F]{8}$"
if [ ! $? -eq 0 ] ; then
    echo "not a valid TMSI"
    exit 1
fi

TMSI_HEX="$(echo $TMSI | sed -re 's,([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2}),\\x\1\\x\2\\x\3\\x\4,g')"

DATA="\x00\x04${TMSI_HEX}"
echo -e "$DATA" | nc -U /tmp/osmocom_mi


