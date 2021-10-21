#!/bin/sh

pkg_name="${1}"
packages=(
    vagrant-hostmanager
    vagrant-disksize
)

if [[ -z ${pkg_name} ]]; then
    for p in ${packages[@]}; do
	vagrant plugin install "${p}"
    done
else
    vagrant plugin install "${pkg_name}"
fi
