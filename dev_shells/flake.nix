{
  description = "Flake for various dev shells";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";

  };

  outputs = { self, nixpkgs }: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};

  in with pkgs; {
    devShells.${system} = rec {
      goShell = mkShell {
        name = "Shell for Go Lang";
        buildInputs = [ go gopls go-outline ];
        shellHook = ''
            echo "Welcome to GoLang Shell!"
            unset GOPATH
        '';
      };

      default = goShell;
    };
  };
}
