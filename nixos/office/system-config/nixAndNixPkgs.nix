# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enabling Nix Flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Adding trusted users
  nix.trustedUsers = [ "root" "shubhranshusingh" ];

}
