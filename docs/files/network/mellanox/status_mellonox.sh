#!/bin/bash
set -xe
DEVICE_ID=$(lspci | awk '/Mellanox/{print $1}')
echo "$DEVICE_ID"
sudo mst start

sudo mstconfig -d $DEVICE_ID query

sudo mlxconfig -d /dev/mst/mt4099_pciconf0 query

