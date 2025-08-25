#!/usr/bin/env bash

set -e
# Autoformat your nix files
#alejandra . >/dev/null

# Shows your changes
#git diff -U0 *.nix

git add .

echo "NixOS Rebuilding..."

nh os switch ~/.dotfiles/nixos/ --hostname $USER -- --cores 4

# Get current generation metadata
current=$(sudo nix-env -p /nix/var/nix/profiles/system --list-generations | grep current)

# Commit all changes witih the generation metadata
git commit -am "$current"
