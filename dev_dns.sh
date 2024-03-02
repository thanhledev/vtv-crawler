#!/bin/bash

# Script needs to be executed as admin
SUDO=''
if (( $EUID != 0 )); then
    SUDO='sudo'
fi

tld=bongda12h.test

function sub_hosts(){
cat <<CONF | $SUDO tee -a /etc/hosts
127.0.0.1   ${tld} traefik.${tld} express.${tld}
CONF
}

sub_help(){
cat << EOM
This script to insert the test domain to NetworkManager with dnsmasq or to /etc/hosts.
Usage: $ProgName <subcommand> [required] {optional}
Subcommands
  hosts                         Modifies /etc/hosts to use it with crawler
EOM
}

subcommand=$1
case $subcommand in
    "" | "-h" | "--help")
        sub_help
        ;;
    *)
        (( $DEBUG )) && print_config
        shift
        echo "Running for ${subcommand}, if available"
        sub_${subcommand} $@
        if [ $? = 127 ]; then
            echo "Error: '$subcommand' is not a known subcommand." >&2
            echo "       Run '$ProgName --help' for a list of known subcommands." >&2
            exit 1
        fi
        ;;
esac
