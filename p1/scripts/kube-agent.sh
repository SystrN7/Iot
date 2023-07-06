#!/bin/bash

# |========== Install k3s agent ==========|
curl -sfL https://get.k3s.io | K3S_TOKEN="$(cat /vagrant/tmp/node-token)" K3S_URL=https://$(cat /vagrant/tmp/server-address):6443 sh -