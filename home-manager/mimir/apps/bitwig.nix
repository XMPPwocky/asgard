{ config, lib, pkgs, ... }:
{
  config.home.packages = lib.mkIf config.yggdrasil.enableMusicProduction [
    pkgs.bitwig-studio
  ];
}
