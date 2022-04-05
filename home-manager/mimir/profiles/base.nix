{ pkgs, lib, config, ... }: {
  options = {
    yggdrasil.enableDesktop = lib.mkEnableOption { default = false; };
    yggdrasil.enableMusicProduction = lib.mkEnableOption { default = false; };
  };

  config = lib.recursiveUpdate
  {
    # we really want to make sure to keep git around for nixos-rebuild flake stuff
    home.packages = [
      pkgs.git 
    ];
  }

  {
    home.packages = lib.mkIf config.yggdrasil.enableMusicProduction [ pkgs.bitwig-studio ];

    programs.firefox.enable = lib.mkIf config.yggdrasil.enableDesktop true;
  };
}
