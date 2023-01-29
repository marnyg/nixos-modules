my-nvim-module:
{
  default = { };
  syncthing = import ./systemModules/syncthingService.nix;
  tailscale = import ./systemModules/tailscaleService.nix;
  nvim = my-nvim-module;
}

