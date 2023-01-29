{ my-nvim-module, home-manager, }:
{
  syncthing = import ./systemModules/syncthingService.nix;
  tailscale = import ./systemModules/tailscaleService.nix;
  nvim = my-nvim-module;
  my-homemanager = import ./systemModules/my-homemanager.nix {
    homeManagerModules = import ./homemanagerModules.nix;
    inherit home-manager;
  };
}

