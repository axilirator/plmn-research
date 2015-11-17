#!/bin/bash

KC="$1"

echo -n "$KC" | grep -qE "^[0-9a-fA-F]{16}[0-9]{2}$"
if [ ! $? -eq 0 ] ; then
    echo "not a valid Kc"
    exit 1
fi

KC_HEX="$(echo $KC | sed -re 's,([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9]{2}),\\x\1\\x\2\\x\3\\x\4\\x\5\\x\6\\x\7\\x\8\\x\9,g')"

DATA="\x00\x09${KC_HEX}"
echo -e "$DATA" | nc -U /tmp/osmocom_mi


