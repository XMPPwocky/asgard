{ pkgs, nixpkgs, lib, system, home-manager, homeConfigurations, base-configs, ... }:
{
  mimir-nixos-fw = nixpkgs.lib.nixosSystem {
    inherit system;

    modules = base-configs.baselineUnstableLaptop ++
      [
      home-manager.nixosModules.home-manager
      ] ++ [{ home-manager.users.mimir = homeConfigurations.mimir; }
      {
        #yggdrasil.hardware.formFactor = "laptop";
        
        yggdrasil.enableGaming = true;

        home-manager.users.mimir = {
          yggdrasil.enableDesktop = true;
          yggdrasil.enableMusicProduction = true;
          yggdrasil.enableGaming = true;
          
          programs.alacritty.enable = true;
          programs.element-desktop.enable = true;
        };
      }
      ];
  };
}
