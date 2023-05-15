{ config, pkgs, ... }:
let 
  cfgPath = ../../../configs;
in
{

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
  };

  programs.tmux = {
    enable = true;
    clock24 = true;
    extraConfig = builtins.readFile(cfgPath + /tmux.conf);
    shell = "~/.nix-profile/bin/zsh";
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
}
