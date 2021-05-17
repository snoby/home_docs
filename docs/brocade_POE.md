

## POE Ports
Currently ports 36 - 47, have POE enabled.

## Port numbering

Understanding Brocade Logical Port Numbers
Brocade uses the follow scheme for naming their ports:

stack ID/module/port
The Stack ID is simply the integer representing the ID number shown when you run 'show stack'.

The module number is static across all switches. They are:

1: Standard RJ-45 1 Gbps copper ports.
2: Ports used for stacking. Typically these are only used for stacking.
3: The SFP+ fiber or copper ports that normally run at 1 Gbps but can be licensed to run at 10 Gbps.
The port number is the simple integer representing the port. This is the number found above or below the physical port on the switch.

You see these x/y/z numbers in the table above, and they will be the method used below to identify ports and port ranges.

```
SSH@switchpoe>show interface brief

Port       Link    State   Dupl Speed Trunk Tag Pvid Pri MAC             Name
1/1/1      Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/2      Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/3      Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/4      Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/5      Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/6      Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/7      Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/8      Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/9      Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/10     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/11     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/12     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/13     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/14     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/15     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/16     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/17     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/18     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/19     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/20     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/21     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/22     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/23     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/24     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/25     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/26     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/27     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/28     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/29     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/30     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/31     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/32     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/33     Up      Forward Full 1G    None  No  1    0   cc4e.2464.9580
1/1/34     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/35     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/36     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/37     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/38     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/39     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/40     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/41     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/42     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/43     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/44     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/45     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/46     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/47     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/1/48     Down    None    None None  None  No  1    0   cc4e.2464.9580
1/2/1      Up      Forward Full 10G   None  No  1    0   cc4e.2464.9580
1/2/2      Up      Forward Full 10G   None  No  1    0   cc4e.2464.9580
1/2/3      Up      Forward Full 10G   None  No  1    0   cc4e.2464.9580
1/2/4      Down    None    None None  None  No  1    0   cc4e.2464.9580
mgmt1      Down    None    None None  None  No  None 0   cc4e.2464.9580

Port       Link    State   Dupl Speed Trunk Tag Pvid Pri MAC             Name
ve1        Up      N/A     N/A  N/A   None  N/A N/A  N/A cc4e.2464.9580
```

## VLAN Setup
i


| Port        | Stack name         | VLAN                |
|-------------|--------------------|---------------------|
| X10 - 1     | (1/2/1)            | VLAN 10 Lab Network |
| X10 - 2     | (1/2/2)            | uplink to main switch             |
| X10 - 3     | (1/2/3)            | Uplink to Miktok switch                    |
| X10 - 4     | (1/2/4)            |                     |
| RJ 45  1/48 | (1/1/1) - (1/1/48) | VLAN 1 Default      |



### Show current VLAN setup
````
enable
username: snoby
password: *******t

configure terminal
show vlan


total PORT-VLAN entries: 1
Maximum PORT-VLAN entries: 64

Legend: [Stk=Stack-Id, S=Slot]

PORT-VLAN 1, Name DEFAULT-VLAN, Priority level0, Spanning tree Off
 Untagged Ports: (U1/M1)   1   2   3   4   5   6   7   8   9  10  11  12
 Untagged Ports: (U1/M1)  13  14  15  16  17  18  19  20  21  22  23  24
 Untagged Ports: (U1/M1)  25  26  27  28  29  30  31  32  33  34  35  36
 Untagged Ports: (U1/M1)  37  38  39  40  41  42  43  44  45  46  47  48

 Untagged Ports: (U1/M2)   1   2   3   4
   Tagged Ports: None
   Uplink Ports: None
 DualMode Ports: None
 Mac-Vlan Ports: None
     Monitoring: Disabled


```

Setup vlan for cable modem

```
# Create vlan
vlan 10 name "CM_WAN"
#Set modem ports to untag
untag eth 1/1/47 to 1/1/48
#tag Ports to 10Gbe
tag eth 1/2/3

interface ethernet 1/2/3
dual-mode
write memory
```
Setup the LAG group
```
lag LAG01 dynamic id 1
ports eth 1/1/47 to 1/1/48
prim 1/1/47
deploy
write memory
```

