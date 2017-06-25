#!/usr/bin/env bash

# MIT License
# Copyright (c) 2017 Nicola Worthington <nicolaw@tfb.net>

set -Euo pipefail

ufw_applications() {
  cat <<EOM
TrinityCore AuthServer
TrinityCore BattleNet
TrinityCore WorldServer
TrinityCore WorldServer RA
TrinityCore WorldServer SOAP
EOM
}

my_networks() {
  if [[ ! -e "${BASH_SOURCE[0]%/*}/.networks" ]]; then
    cat <<EOM
127.0.0.1/32
10.0.0.0/8
192.168.0.0/16
172.16.0.0/12
EOM
  else
    cat "${BASH_SOURCE[0]%/*}/.networks"
  fi
}

main() {
  declare app="" net=""
  while read -r net ; do
    while read -r app ; do
      ufw allow from "$net" to any app "$app"
    done < <(ufw_applications)
  done < <(my_networks)
}

main "$@"

