{ config, lib, pkgs, ... }:
{
  options.yggdrasil.programs.zotero.enabled = lib.mkEnableOption { };

  config = {
    home.packages = lib.mkIf config.yggdrasil.programs.zotero.enabled [ pkgs.zotero ];
  };
}
