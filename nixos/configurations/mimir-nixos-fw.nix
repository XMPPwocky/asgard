{ pkgs, nixpkgs, lib, system, home-manager, homeConfigurations, base-configs, ... }:
  nixpkgs.lib.nixosSystem (let
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
          yggdrasil = yggdrasilCfg;

          networking.hostName = "mimir-nixos-fw";

          users.users.mimir.extraGroups = [ "vboxusers" ];
          virtualisation.virtualbox.host.enable = true;

          users.mutableUsers = true;
          users.users.mimir = {
            isNormalUser = true;
            description = "Mimir";

            extraGroups = [ "audio" "jackaudio" "wheel" "networkmanager" "input" "plugdev" ];
          };

          home-manager.users.mimir = lib.mkMerge
          [
            homeConfigurations.mimir
            {
              config.yggdrasil-home = { systemConfig = yggdrasilCfg; };
              config.programs.alacritty.enable = true;
              config.programs.element-desktop.enable = true;
            }
          ];
        };
      }
      ];
  })
