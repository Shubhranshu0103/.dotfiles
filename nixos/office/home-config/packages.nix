{ config, pkgs, ... }:
{

  home.packages = with pkgs; [
    htop 
    gparted 
    git
    google-chrome
    slack
    redis
    libgccjit
    haskell-language-server
    stack
    ghc
  ];

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

}
