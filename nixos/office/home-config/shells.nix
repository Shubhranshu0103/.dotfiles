{ config, pkgs, ... }:
let
  euler-tools-path= "/home/shubhranshusingh/Workspace/env-repos/euler-tools/euler-bin";
in {

  programs.zsh = {
    enable = true;
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    initExtra = ''
      export PATH="$PATH:${euler-tools-path}"
    '';
  };

  programs.bash.enable = true;

}
