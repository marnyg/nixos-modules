{ home-manager, homeManagerModules,  ... }:
{ pkgs, lib, config, ... }:
with lib;
{
  options.modules.my-homeanager = {
    enable = mkOption { type = types.bool; default = false; };
  };

  config = mkIf config.modules.my-homemanager.enable
    {
      import = [ home-manager ];
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      #home-manager.extraSpecialArgs = { inherit username; };
      home-manager.users.nixos.imports = [
        homeManagerModules
      ];
    };
}
