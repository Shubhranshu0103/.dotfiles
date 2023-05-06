{
  description = "Shubhranshu's Configs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    home-manager.url = "github:nix-community/home-manager/release-22.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = {nixpkgs, home-manager, hyprland, ...}: 
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true;};
    };
    #pkgs = nixpkgs.legacyPackages.${system};

    lib = nixpkgs.lib;

  in {
    homeConfigurations = {
      shubhranshu = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./users/shubhranshu/home.nix
          hyprland.homeManagerModules.default
          { wayland.windowManager.hyprland.enable = true;}
        ];
      };
    };
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;

        modules = [
          ./system/configuration.nix
          hyprland.nixosModules.default
          {programs.hyprland = {
            enable = true;
            nvidiaPatches = true;
            
          };
          }
          {
            programs.xwayland.enable = true;
          }
        ];
      };
    };
  };
}
