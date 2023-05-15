# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enabling Flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  users.users.shubhranshu = {
    packages = with pkgs; [
      firefox
    ];
    shell = pkgs.zsh;
  };
  
  # Enabling mysql
  services.mysql.enable = true;
  services.mysql.package = pkgs.mysql80;


  # Setting up Redis Service
  services.redis.servers."euler" = {
    enable = true;
    port = 6379;
  };

}
