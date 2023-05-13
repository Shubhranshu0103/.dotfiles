# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.shubhranshu = {
    isNormalUser = true;
    description = "shubhranshu";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
    #  thunderbird
    ];
    shell = pkgs.zsh;
  };


}
