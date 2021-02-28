# Mellanox updating and configs

The three Qsfp cards that I have are the :
MCX354-FCBT with a PSID of MT_1090120019.  Last version update took them to firmware version 2.42.5000

these webpages were very helpful
https://that.guru/blog/updating-mellanox-connectx-3/

I had to download the source code for mstflint and had to compile and install it to properly flash the boards.


some helpful scripts that use mstflint are here
[update_mellonox.sh](files/network/mellanox/update_mellonox.sh)
[set_srvio_mellonox.sh](files/network/mellanox/set_srvio_mellonox.sh)
[status_mellonox.sh](files/network/mellanox/status_mellonox.sh)

files/network/mellanox$ ls
set_srvio_mellonox.sh* status_mellonox.sh*    update_mellonox.sh*

```bash
#!/bin/bash
set -xe
DEVICE_ID=$(lspci | awk '/Mellanox/{print $1}')
echo "$DEVICE_ID"

sudo mstconfig -d $DEVICE_ID query

sudo mstconfig  -d $DEVICE_ID set SRIOV_EN=1 NUM_OF_VFS=8
sudo mst start
sudo mlxconfig -d /dev/mst/mt4099_pciconf0 set LINK_TYPE_P1=2 LINK_TYPE_P2=2
```

## Performance tuning suggtestions for Mellanox
