{ config, pkgs, ... }:
{
  home.packages = [
  pkgs.bitwig-studio
  pkgs.yabridge pkgs.yabridgectl
  ];
}
