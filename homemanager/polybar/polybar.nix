{ pkgs, lib, config, ... }:
with lib;
{
  options.modules.polybar = {
    enable = mkOption { type = types.bool; default = false; };
  };

  config = mkIf config.modules.polybar.enable {
    # home.file = {
    #    ".config/polybar/conf.ini" = {
    #      text= (builtins.readFile ./config.ini);
    #    };
    # };
    services.polybar = {
      enable = true;
      # configFile =  "./config.ini";
      extraConfig = (builtins.readFile ./config.ini);
      script = with pkgs; ''
        for m in $(polybar --list-monitors | ${coreutils}/bin/cut -d":" -f1); do
            MONITOR=$m polybar --reload example &
        done
      '';
    };
  };
}
