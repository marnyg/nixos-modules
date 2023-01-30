{ pkgs, lib, config, ... }:
with lib;
{
  options.modules.my-homemanager = {
    enable = mkOption { type = types.bool; default = false; };
  };

  config = mkIf config.modules.my-homemanager.enable
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      #home-manager.extraSpecialArgs = { inherit username; };
      home-manager.users.nixos.imports = builtins.attrValuesimport import ./homemanagerModules.nix;
    };
}
