{
  description = "Shubhranshu's Configs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    home-manager.url = "github:nix-community/home-manager/release-22.11";
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
    hostName = "nixos-home";

  in {
    homeConfigurations = {
      shubhranshu = home-manager.lib.homeManagerConfiguration {
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
