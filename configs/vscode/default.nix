let
  userSettings = import ./settings.nix;
  keybindings = import ./keybindings.nix;

in { inherit userSettings keybindings; }