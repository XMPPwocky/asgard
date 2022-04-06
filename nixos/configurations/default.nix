{ pkgs, nixpkgs, lib, system, home-manager, homeConfigurations, base-configs, ... }:
{
  mimir-nixos-fw = nixpkgs.lib.nixosSystem (let
    yggdrasilCfg = {
      enableDesktop = true;
      enableMusicProduction = true;
      enableGaming = true;
      enableWorkstation = true;
    };
  in {
    inherit system;

    modules = base-configs.baselineUnstableLaptop ++
      [
      home-manager.nixosModules.home-manager
      ] ++ [
      { home-manager.users.mimir = homeConfigurations.mimir; }
      { home-manager.users.mimir.options.yggdrasil = lib.mkOption { }; }      
      {
        yggdrasil = yggdrasilCfg;
        home-manager.users.mimir = {
          yggdrasil = yggdrasilCfg;
          programs.alacritty.enable = true;
          programs.element-desktop.enable = true;
        };
      }
      ];
  });
}
