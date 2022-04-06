{ pkgs, lib, config, ... }: {
  options = {
    yggdrasil.enableDesktop = lib.mkEnableOption { default = false; };
    yggdrasil.enableMusicProduction = lib.mkEnableOption { default = false; };
    yggdrasil.enableGaming = lib.mkEnableOption { default = false; };

    # Workstation = development, hacking, "control plane" tasks
    yggdrasil.enableWorkstation = lib.mkEnableOption { default = false; };
  };

  config = lib.recursiveUpdate
  {
    # we really want to make sure to keep git around for nixos-rebuild flake stuff
    home.packages = [
      pkgs.git 
    ];
  }

  (with lib; {
    home.packages = recursiveUpdate
      (mkIf config.yggdrasil.enableMusicProduction [ pkgs.bitwig-studio ])
      (mkIf config.yggdrasil.enableDesktop [ pkgs.obsidian ]);
      (mkIf config.yggdrasil.enableWorkstation [ pkgs.nixopsUnstable ]);

    programs.firefox.enable = lib.mkIf config.yggdrasil.enableDesktop true;
  });
}
