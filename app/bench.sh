#!/bin/bash

HOST=SET_TARGET_HOST

echo "----- start apache bench -----"
echo "host: $HOST"

siege -c 1 -r 10 -t 10 $HOST
