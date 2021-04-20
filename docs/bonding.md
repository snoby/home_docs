

# Setting up bonding 

For testing on the ICX-6450 brocade switch 

This will setup the link with prot 47 and 48 on the switch ( to do the 10GB ports that would be the second slot so instead of 1/1 it would be 1/2)
```
enable
conf t

lag <name> dynamci id <random id>
ports e 1/1/47 to 1/1/48
primary-port 1/1/47
deploy
write
```

Setup in debian the link aggreggation

```
source /etc/network/interfaces.d/*
auto lo
iface lo inet loopback

allow-hotplug enp3s0f0
allow-hotplug enp3s0f1
#allow-hotplug enp4s0f0
#allow-hotplug enp4s0f1

# 10G card
allow-hotplug ens1



# bonded channel to cable modem
auto enp3s0f0
iface enp3s0f0 inet manual
bond-master bond0
bond-mode 4
#bond-primary enp3s0f0 enp3s0f1

auto enp3s0f1
iface enp3s0f1 inet manual
bond-master bond0
bond-mode 4
#bond-primary enp3s0f0 enp3s0f1
#
# view status with cat /proc/net/bonding/bond0
# bond-mode 4 = 802.3ad
#
auto bond0
iface bond0 inet dhcp
        bond-slaves none
	bond-mode 4
	bond-miimon 100
	bond-downdelay 200
	bond-updelay 200
	bond-lacp-rate fast
	bond-xmit-hash-policy layer3+4


	#slaves enp3s0f0 enp3s0f1
#iface enp3s0f0 inet manual
#iface enp3s0f1 inet manual

auto ens1
iface ens1 inet dhcp
#pre-up /sbin/ifconfig $IFACE mtu 9000

#auto  enp4s0f0
#iface enp4s0f0 inet static
#	address 10.0.0.251
#	netmask 255.255.255.0
#	gateway 10.0.0.1
#
#
# This goes to the cable modem
#
#auto vmbr0
#iface vmbr0 inet dhcp
#	bridge_ports enp3s0f0 enp3s0f1
#	bridge_stp off
#	bridge_fd 0
```


**NOTES**: You must use bond-xmit-hash-policy layer3+4 to get the bandwidth to aggregate otherwise one line is for xmit the other is for receive....