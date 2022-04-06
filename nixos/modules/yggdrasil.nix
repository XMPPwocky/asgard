{ config, lib, pkgs, ...}:
{
  options.yggdrasil = with lib; {
    enableGaming = mkEnableOption { };
  };

  config = with lib; {
    programs.steam.enable = lib.mkIf config.yggdrasil.enableGaming true;
  };
}
