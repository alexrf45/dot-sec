#!/bin/sh

# Prints just the ip addresses for given interfaces.

get_ip() {
  for int in $@; do
    ip addr show $int | grep -m 1 inet | awk '{print $2}' | cut -d / -f 1
    #   ^^ I will be focusing on this line!
  done
}

# Use eth0 if no interfaces are given
INTERFACE=eth0

if [ "$#" -ne 0 ]; then
  INTERFACE="$@"
fi

get_ip $INTERFACE
