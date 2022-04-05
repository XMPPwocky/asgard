{ pkgs, lib, config, ... }: {
  options = {
    yggdrasil.useGUIDesktop = lib.mkEnableOption { default = false; };
    yggdrasil.enableMusicProduction = lib.mkEnableOption { default = false; };
  };

  config = lib.recursiveUpdate {
    home.packages =
    [
      pkgs.git # we really want to make sure to keep git around for nixos-rebuild flake stuff
    ];
  }
  {
    home.packages = lib.mkIf config.yggdrasil.enableMusicProduction [ pkgs.bitwig-studio ];
  };
}
