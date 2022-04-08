{ config, lib, pkgs, ... }:
lib.mkIf
  config.yggdrasil-home.systemConfig.enableDesktop
{
  home.packages = [ pkgs.zotero ];
}
