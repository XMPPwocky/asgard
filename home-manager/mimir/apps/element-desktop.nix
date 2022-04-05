{ pkgs, lib, config, ... }:
{
  options.programs.element-desktop.enable = lib.mkEnableOption { default = false; };

  config.home.packages = lib.mkIf config.programs.element-desktop.enable [ pkgs.element-desktop ];
}
