{ pkgs, lib, config, ... }: lib.mkMerge [
  {
    nixpkgs.config.allowUnfree = true;

    # we really want to make sure to keep git around for nixos-rebuild flake stuff
    home.packages = [
      pkgs.git 
    ];
  }

  (with lib; mkIf config.yggdrasil-home.systemConfig.enableDesktop {
    programs.firefox.enable = true;
    home.packages = with pkgs; [
      obsidian
    ];

    services.dunst.enable = true;
    services.network-manager-applet.enable = true;
  })

  (with lib; {
    home.packages = mkIf config.yggdrasil-home.systemConfig.enableMusicProduction [ pkgs.bitwig-studio ];
  })
]
