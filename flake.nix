{
  # description = "Nix Flake for deploying Terraform";
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, flake-utils, }:
  flake-utils.lib.eachDefaultSystem
  (system:
    let
      pkgs = import nixpkgs {
        inherit system;
      };
    in
    with pkgs;
    {
      devShells.default = mkShell {
        buildInputs = [
          hugo
        ];
      };
    }
  );
}

