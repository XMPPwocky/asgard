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
        networking.hostName = "mimir-nixos-fw";

        yggdrasil = yggdrasilCfg;
        home-manager.users.mimir = {
          yggdrasil-home = { systemConfig = yggdrasilCfg; };
          programs.alacritty.enable = true;
          programs.element-desktop.enable = true;
        };
      }
      { home-manager.users.mimir = homeConfigurations.mimir; }
      ];
  });
}
