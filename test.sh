#!/usr/bin/env bash

set -x

current=$(nixos-rebuild list-generations | grep current)

echo $current
