{ config, pkgs, ... }:
let 
  cfgPath = ../../../configs;
in
{

  programs.vim = {
    enable = true;
    extraConfig = ''
      set rnu
      inoremap jk <esc>
    '';
  };

  programs.neovim = {
    enable = true;
  };

  xdg.configFile = {
    "nvim" = {
      #source = config.lib.file.mkOutOfStoreSymlink  cfgPath + /neovim;
      source = config.lib.file.mkOutOfStoreSymlink  "/home/shubhranshu/.dotfiles/configs/neovim";
    };
  };

}
