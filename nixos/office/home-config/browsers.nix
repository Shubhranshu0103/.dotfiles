{ config, pkgs, ... }:
let 
  qtconfig = builtins.readFile ../../../configs/qutebrowser/config.py;
in {

  programs.qutebrowser = {
    enable = true;
    loadAutoconfig = true;
    extraConfig = qtconfig;
  };

}
