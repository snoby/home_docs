#!/bin/bash
set -xe
DEVICE_ID=$(lspci | awk '/Mellanox/{print $1}')
echo "$DEVICE_ID"

sudo mstconfig -d $DEVICE_ID query

sudo mstconfig  -d $DEVICE_ID set SRIOV_EN=1 NUM_OF_VFS=8 
sudo mst start
sudo mlxconfig -d /dev/mst/mt4099_pciconf0 set LINK_TYPE_P1=2 LINK_TYPE_P2=2 

