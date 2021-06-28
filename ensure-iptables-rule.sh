#!/bin/sh

if [ "$VNET_CIDR" = "" ]
then
  echo "VNET_CIDR ENV variable is empty, aborting."
  exit 1
fi

IPTABLES=/sbin/iptables

RULE="-t nat -A POSTROUTING -m addrtype ! --dst-type local ! -d ${VNET_CIDR} -j MASQUERADE"

while : ; do
  if $IPTABLES -C ${RULE}
  then
    echo "Rule was in place"
  else
    echo "Rule not found, adding"
    $IPTABLES -A ${RULE}
  fi
  sleep 10
done
