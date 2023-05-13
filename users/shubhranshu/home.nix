{ config, pkgs, ... }:
let

  myconfig = pkgs.vimUtils.buildVimPlugin {
    name = "my-config";
    src = ./my-neovim-config;
  };

in {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "shubhranshu";
  home.homeDirectory = "/home/shubhranshu";


  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    htop 
    gparted 
    vscode
    git
    blender
  ];

  programs.vim = {
    enable = true;
    extraConfig = ''
      set rnu
      inoremap jk <esc>
    '';
  };

  programs.git = {
    enable = true;
    userName = "shubhranshu0103";
    userEmail = "shubhranshusingh.work@gmail.com";
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
  };

  programs.bash.enable = true;

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  programs.wezterm = {
    enable = true;
    extraConfig = builtins.readFile(./wezterm.lua);
  };

  programs.tmux = {
    enable = true;
    clock24 = true;
    prefix = "C-space";
  };

  programs.neovim = {
    enable = true;
  };

  xdg.configFile = {
    "nvim" = {
      source = ./my-neovim-config/lua;
    };
  };

  programs.qutebrowser = {
    enable = true;
    loadAutoconfig = true;
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
}
