#Mellanox updating and configs

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


##Performance tuning suggtestions for Mellanox
