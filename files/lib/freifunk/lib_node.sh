#!/bin/sh
. /lib/ar71xx.sh

# Hardware-Address according to sticker
get_main_address() {
    if is_dual_wifi; then
        get_radio_address "wlan1"
    else
        get_radio_address "wlan0"
    fi
}

get_radio_address() {
    ip l sh $1 | awk '/ether/ {print $2}'
}


# Node_Id = HW-Address, alphanumeric
get_node_id() {
    macaddr=$(get_main_address)
    echo ${macaddr//:/}
}

# Dual wifi? yes / no
# More than two devies => dual wifi, too.
# UNDEFINED, IF WIFI IS PRESENT!
is_dual_wifi() {
    inum=$(iw phy | grep -c Wiphy)
    test "$inum" != "1"
}
