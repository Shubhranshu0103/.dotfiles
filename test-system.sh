#!/bin/sh

pushd ~/.dotfiles
sudo nixos-rebuild test --flake .#
popd
