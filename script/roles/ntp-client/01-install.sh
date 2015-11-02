#!/bin/bash

which ntpd || install ntp

cat >/etc/ntp.conf <<EOF
# /etc/ntp.conf, configuration for ntpd; see ntp.conf(5) for help

driftfile /var/lib/ntp/ntp.drift


# Enable this if you want statistics to be logged.
#statsdir /var/log/ntpstats/

statistics loopstats peerstats clockstats
filegen loopstats file loopstats type day enable
filegen peerstats file peerstats type day enable
filegen clockstats file clockstats type day enable

# Access control configuration; see /usr/share/doc/ntp-doc/html/accopt.html for
# details.  The web page <http://support.ntp.org/bin/view/Support/AccessRestrictions>
# might also be helpful.
#
# Note that "restrict" applies to both servers and clients, so a configuration
# that might be intended to block requests from certain clients could also end
# up blocking replies from your own upstream servers.

# By default, exchange time with everybody, but don't allow configuration.
restrict -4 default kod notrap nomodify nopeer noquery
restrict -6 default kod notrap nomodify nopeer noquery

# Local users may interrogate the ntp server more closely.
restrict 127.0.0.1
restrict ::1

# Clients from this (example!) subnet have unlimited access, but only if
# cryptographically authenticated.
#restrict 192.168.123.0 mask 255.255.255.0 notrust


# If you want to provide time to your local subnet, change the next line.
# (Again, the address is an example only.)
#broadcast 192.168.123.255

# If you want to listen to time broadcasts on your local subnet, de-comment the
# next lines.  Please do this only if you trust everybody on the network!
#disable auth
#broadcastclient
EOF

ntp_servers="$(read_attribute 'rebar/ntp/servers' |jq -r '.[]')"
if [[ ! $ntp_servers || $ntp_servers = null ]]; then
    ntp_servers="0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org"
fi
for server in $ntp_servers; do
    printf 'server %s iburst minpool 4' >> /etc/ntp.conf
done
add_svcalt ntp centos ntpd
add_svcalt ntp fedora ntpd

service ntp stop || :
service ntp enable || :
service ntp start
