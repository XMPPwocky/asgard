{ config, lib, pkgs, ...}:
{
  options.yggdrasil = with lib; {
    enableGaming = mkEnableOption { };
  }
}
