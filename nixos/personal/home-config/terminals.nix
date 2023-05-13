{ config, pkgs, ... }:
let 
  cfgPath = ../../../configs;
in
{

  programs.wezterm = {
    enable = true;
    extraConfig = builtins.readFile(cfgPath + /wezterm.lua);
  };

}
