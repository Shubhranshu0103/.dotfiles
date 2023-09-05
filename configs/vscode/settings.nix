let
  editorSettings = import ./editor.nix;
  terminalSettings = import ./terminal.nix;
  workBenchSettings = import ./workbench.nix;
  zenModeSettings = import ./zenmode.nix;
  extensionConfigs = import ./extension-configs;

in editorSettings // terminalSettings // workBenchSettings // zenModeSettings // extensionConfigs
