Electronic Frontier Finland (Effi) - Tor Exit Node
=================================================

Electronic Frontier Finland (Effi) is a Finnish on-line civil rights organization founded in 2001. While not formally affiliated with the U.S.-based Electronic Frontier Foundation, the two organizations share many of their goals. Effi is a member of the Global Internet Liberty Campaign and a founding member of European Digital Rights (EDRi).

[Exit-tyyppisen reitittimen jakelema ilmoitussivu / Tor Exit Node info page.](http://htmlpreview.github.io/?https://github.com/juhanurmi/exitnode/blob/master/tor-exit-notice.html)

```sh
sudo bash remove.sh
sudo apt-get update && sudo apt-get upgrade
sudo rpi-update
sudo apt-get install haveged
sudo apt-get install tor
sudo cp torrc /etc/tor/torrc
sudo cp tor-exit-notice.html /etc/tor/tor-exit-notice.html
sudo cp sysctl.conf /etc/sysctl.conf
sudo cp rules.v4 /etc/iptables/rules.v4
sudo apt-get install iptables-persistent
sudo modprobe ip_conntrack
sudo service iptables-persistent restart
sudo sysctl -p /etc/sysctl.conf
sudo service tor restart
```
