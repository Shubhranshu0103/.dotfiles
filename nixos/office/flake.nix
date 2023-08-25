{
  description = "Shubhranshu's Configs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {nixpkgs, home-manager, ...}: 
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true;};
    };
    #pkgs = nixpkgs.legacyPackages.${system};

    lib = nixpkgs.lib;
    hostName = "nixos-office";

  in {
    homeConfigurations = {
      shubhranshusingh = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home-config/home.nix
        ];
      };
    };
    nixosConfigurations = {
      ${hostName} = lib.nixosSystem {
        inherit system;

        modules = [
          ./system-config/configuration.nix
          {
            programs.xwayland.enable = true;
          }
        ];
      };
    };
  };
}
