#!/bin/bash
set -e
pushd ~/dotfiles/nixos/
echo "NixOs Rebuilding ..."
sudo nixos-rebuild switch &>nixos-switch.log || (
	cat nixos-switch.log | grep --color error && false)
gen=$(nixos-rebuild list-generations | grep current)
git commit -am "$gen"
popd
