{ config, lib, pkgs, ... }:
lib.mkIf
  config.yggdrasil.enableDesktop
{
  home.packages = [ pkgs.zotero ];
}
