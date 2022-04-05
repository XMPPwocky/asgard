{ pkgs, nixpkgs, lib, system, home-manager, homeConfigurations, base-configs, ... }:
{
  mimir-nixos-fw = nixpkgs.lib.nixosSystem {
    inherit system;

    modules = base-configs.baselineUnstableLaptop ++
      [
      home-manager.nixosModules.home-manager
      ] ++ [{ home-manager.users.mimir = homeConfigurations.mimir; }
      {
        home-manager.users.mimir = {
          yggdrasil.useGUIDesktop = true;
          yggdrasil.enableMusicProduction = true;
          #yggdrasil.hardware.formFactor = "laptop";
          
          programs.alacritty.enable = true;
          programs.element-desktop.enable = true;
        };
      }
      ];
  };
}
