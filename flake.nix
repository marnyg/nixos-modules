{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    flake-utils.url = "github:numtide/flake-utils";
    my-nvim.url = "github:marnyg/nvim-conf";
  };

  outputs = { self, nixpkgs, my-nvim, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      {
        nixosModules = (import ./nixosModules.nix my-nvim.nixosModule2."${system}");
        homeManagerModules = import ./homemanagerModules.nix;
        devShells = import ./flakeUtils/shell.nix (import nixpkgs { inherit system; });
        checks = import ./flakeUtils/checks.nix (import nixpkgs { inherit system; });
        formatter = nixpkgs.legacyPackages.${system}.nixpkgs-fmt;
      });
}
