{ config, pkgs, ... }:
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
      source = config.lib.file.mkOutOfStoreSymlink  "/home/shubhranshusingh/.dotfiles/configs/neovim";
    };
  };


  programs.vscode = 
    let 
      vscodeConfig = import ../../../configs/vscode;
    in
      with vscodeConfig; {
        enable = true;
        enableUpdateCheck = false;
        enableExtensionUpdateCheck = false;
        mutableExtensionsDir = false;
        keybindings = keybindings;
        userSettings = userSettings;
        extensions = with pkgs.vscode-extensions;[
          bbenoist.nix
          vscodevim.vim
          haskell.haskell
          cweijan.vscode-database-client2
        ];
      };

}
