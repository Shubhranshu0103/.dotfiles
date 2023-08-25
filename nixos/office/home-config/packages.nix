{ config, pkgs, ... }:
{

  home.packages = with pkgs; [
    htop 
    gparted 
    vscode
    git
    blender
  ];

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

}
