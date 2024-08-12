#!/usr/bin/env bash
set -e

echo "Activating feature 'HCP'"

apt-get update && export DEBIAN_FRONTEND=noninteractive &&
    apt-get -y install --no-install-recommends \
        gpg \
        coreutils \
        xdg-utils

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt install hcp -y
