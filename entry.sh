#!/bin/sh

# Setup server keys
[ ! -f "/etc/nsd/nsd_server.key" ] && nsd-control-setup
chown nsd:nsd /etc/nsd/nsd_control.key /etc/nsd/nsd_control.pem /etc/nsd/nsd_server.pem

# Setup config if it doesn't already exist
[ ! -f "/etc/nsd/nsd.conf"] && cp -a /etc/.nsd_defaults/nsd.conf /etc/nsd/nsd.conf

# Fix nsd directory permissions, this is where it writes its database
chown nsd:nsd /var/lib/nsd

exec $@
