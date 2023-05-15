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
      source = cfgPath + /neovim;
    };
  };

  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = true;
    extensions = with pkgs.vscode-extensions;[
      jnoortheen.nix-ide
      haskell.haskell
      cweijan.vscode-database-client2
      justusadam.language-haskell
    ];
  };

}
