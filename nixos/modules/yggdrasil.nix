{ config, lib, pkgs, ...}:
{
  options.yggdrasil = with lib; {
    enableDesktop = mkEnableOption { };
    enableGaming = mkEnableOption { };
    enableMusicProduction = mkEnableOption { };
    enableWorkstation = mkEnableOption { };
  };

  config = with lib; {
    programs.steam.enable = lib.mkIf config.yggdrasil.enableGaming true;
  };
}
