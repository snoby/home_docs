#!/bin/bash
set -xe
DEVICE_ID=$(lspci | awk '/Mellanox/{print $1}')
echo "$DEVICE_ID"

#sudo mstconfig -d $DEVICE_ID query

sudo mstflint -d $DEVICE_ID q

sudo mstflint -d $DEVICE_ID -i /home/snoby/firmware/fw-ConnectX3-rel-2_42_5000-MCX354A-FCB_A2-A5-FlexBoot-3.4.752.bin burn


