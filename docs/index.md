
## User Services

- [Transmission](http://dockerhost:9091){target=\_blank}
- [Jackett](http://dockerhost:9117){target=\_blank}
- [Sonarr](http://dockerhost:8989){target=\_blank}
- [Radarr](http://dockerhost:7878){target=\_blank}
- [Speed Test](http://dockerhost:12080){target=\_blank}
- [plex ](http://plexbox:32400){target=\_blank}
- [cockpit for storage](https://storage:9090){target=\_blank}
- [proxmox](https://proxmox:8006){target=\_blank}
- [k8s proxmox](https://k8s.mattsnoby.com:8006){target=\_blank}

## Monitoring and Deployment Serices

- [prometheus](http://prom.mattsnoby.com){target=\_blank}
- [grafana](http://grafana.mattsnoby.com){target=\_blank}
- [drone](https://drone.mattsnoby.com:){target=\_blank}
- [kibana](http://kibana.mattsnoby.com:){target=\_blank}


## Hardware

- [HD Antenna Tuners](http://my.hdhomerun.com/#tab-2){target=\_blank}
- [Ipfire Router](https://10.0.0.1:444){target=\_blank}
- [Zyxel Swich](https://10.0.0.2){target=\_blank}
- [Cisco Fiber Swich](https://10.0.0.3){target=\_blank}
- [Mikrotek 24 Port Switch](http://10.0.0.4){target=\_blank}
- [Brocade ICX 6450 Switch POE](http://10.0.0.253){target=\_blank}
- [AC1200 Access Point](https://10.0.0.5){target=\_blank}
- [Mikrotek Switch](https://10.0.0.6){target=\_blank}
- [Garage Access Point](https://10.0.0.11){target=\_blank}
- [Nighthawk Access point ](https://10.0.0.12){target=\_blank}
- [Comfast Garage Access Point ](http://10.0.0.13){target=\_blank}
- [chassis chia file server  ](http://10.0.0.22){target=\_blank}
- [220V PDU lightning ](http://10.0.0.23){target=\_blank}
- [220V PDU thunder ](http://10.0.0.24){target=\_blank}


### Servers iDrac

- [r710 idrac](https://10.0.0.9){target=\_blank}
- [r510 idrac](https://10.0.0.20){target=\_blank}
- [r510 idrac chassis](https://10.0.0.21){target=\_blank}
- [r510 idrac blank](https://10.0.0.196){target=\_blank}
- [C220M4 CIMC](https://C220-CIMC){target=\_blank}
## Static IP Addresses

| machine                  | ip: port     | service                     |
| ------------------------ | ------------ | --------------------------- |
| router                   | 10.0.0.1:444 | router                      |
| zyxel switch             | 10.0.0.2     | 1Gb switch                  |
| SG350XG-24F              | 10.0.0.3     | 10Gb Fiber switch           |
| Mikrotek-24              | 10.0.0.4     | 24port with 2 spf+          |
| AC1200 Upstairs          | 10.0.0.5     | playroom access point       |
| Mikrotek                 | 10.0.0.6     | 10Ge Mikrotek switch        |
| ICX6450-48 POE           | 10.0.0.17    |                             |
|                          |              |                             |
| r710 iDrac               | 10.0.0.9     | idrac for r710              |
| Linksys EA6500           | 10.0.0.11    | Garage Access Point         |
| Netgear nighthawk        | 10.0.0.12    | Masterbed room access point |
| Comcast Netgear nighthawk| 10.0.0.13    | in storage                  |
| ICX6450-24 POE           | 10.0.0.16    | The main 24 port switch     |
|                          |              |                             |
| r510 iDrac  storage      | 10.0.0.20    | idrac for r510              |
| r510 iDrac  chassis      | 10.0.0.21    | idrac-chia is hostname      |
| r510 chassis chassis     | 10.0.0.22    | chassis is hostname         |
| PDU lightning            | 10.0.0.23    | lightning is hostname       |
| PDU thunder              | 10.0.0.24    | thunder is hostname         |
|                          |              |                             |
|                          |              |                             |
| k8s proxmox              | 10.0.0.25    | k8 is hostname              |
|                          |              |                             |
| r510 blank               | 10.0.0.195   | blank is hostname           |
| r510 iDrac  blank        | 10.0.0.196   | idrac-disk is hostname      |

### Special Machines
The `blank` machine is the host to the 12 spinning rust disk shelf I am using for chia plot creation.  It does DHCP, it has an idrac call 'idrac-disk'