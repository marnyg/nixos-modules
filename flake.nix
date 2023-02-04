{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    flake-utils.url = "github:numtide/flake-utils";
    my-nvim.url = "github:marnyg/nvim-conf";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, my-nvim, flake-utils, home-manager }:
    flake-utils.lib.eachDefaultSystem (system:
      {
        hmModules = {
          autorandr = import ./homemanager/autorandr/desktop.nix;
          bspwm = import ./homemanager/bspwm/bspwm.nix;
          dunst = import ./homemanager/dunst/dunst.nix;
          firefox = import ./homemanager/firefox.nix;
          git = import ./homemanager/git.nix;
          kitty = import ./homemanager/kitty.nix;
          newsboat = import ./homemanager/newsboat.nix;
          polybar = import ./homemanager/polybar/polybar.nix;
          xmonad = import ./homemanager/xmonad;
          zellij = import ./homemanager/zellij.nix;
          zsh = import ./homemanager/zsh.nix;

        };
        nixosModules = {
          syncthing = import ./systemModules/syncthingService.nix;
          tailscale = import ./systemModules/tailscaleService.nix;
          nvim = my-nvim.nixosModule2."${system}";
        };
        devShells = import ./flakeUtils/shell.nix (import nixpkgs { inherit system; });
        checks = import ./flakeUtils/checks.nix (import nixpkgs { inherit system; });
        formatter = nixpkgs.legacyPackages.${system}.nixpkgs-fmt;
      });
}
