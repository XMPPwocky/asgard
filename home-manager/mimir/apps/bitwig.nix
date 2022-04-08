{ config, lib, pkgs, ... }:
{
  config.home.packages = lib.mkIf config.yggdrasil-home.systemConfig.enableMusicProduction [
    pkgs.bitwig-studio
  ];
}
