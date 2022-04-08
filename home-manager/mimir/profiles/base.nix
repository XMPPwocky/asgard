{ pkgs, lib, config, ... }: {
  config = lib.recursiveUpdate
  {
    # we really want to make sure to keep git around for nixos-rebuild flake stuff
    home.packages = [
      pkgs.git 
    ];
  }

  (with lib; {
    home.packages = recursiveUpdate (recursiveUpdate
      (mkIf config.yggdrasil-home.systemConfig.enableMusicProduction [ pkgs.bitwig-studio ])
      (mkIf config.yggdrasil-home.systemConfig.enableDesktop [ pkgs.obsidian ]))
      (mkIf config.yggdrasil-home.systemConfig.enableWorkstation [ pkgs.nixopsUnstable ]);

    programs.firefox.enable = lib.mkIf config.yggdrasil-home.systemConfig.enableDesktop true;
  });
}
