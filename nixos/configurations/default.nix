{ pkgs, nixpkgs, lib, system, home-manager, homeConfigurations, base-configs, ... }:
{
  mimir-nixos-fw = nixpkgs.lib.nixosSystem (let
    yggdrasilCfg = {
      enableBluetooth = true;
      enableDesktop = true;
      enableMusicProduction = true;
      enableGaming = true;
      enableWorkstation = true;
    };
  in {
    inherit system;

    modules = base-configs.baselineUnstableLaptop ++ [
        home-manager.nixosModules.home-manager
      {
        imports = [
        ../machines/mimir-nixos-fw/configuration.nix
        ];

        config = {
          networking.hostName = "mimir-nixos-fw";

          yggdrasil = yggdrasilCfg;
          home-manager.users.mimir = lib.mkMerge
          [  homeConfigurations.mimir
          {
            config.yggdrasil-home = { systemConfig = yggdrasilCfg; };
            config.programs.alacritty.enable = true;
            config.programs.element-desktop.enable = true;
          }];
        };
      }
      ];
  });
}
