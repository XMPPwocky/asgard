{ jotunnNixosModules, home-manager, pkgs, system, flake-utils, ... }:
{
  baselineUnstableLaptop = [
    { config = {
      nixpkgs.config.allowUnfree = true;

      yggdrasil.nixpkgs-branch = "nixos-unstable";

      environment.systemPackages = [ pkgs.git ];

      networking.networkmanager.enable = true;

      networking.firewall.enable = true;
      networking.firewall.checkReversePath = true;

      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;

    };}

    jotunnNixosModules.yggdrasil

    jotunnNixosModules.nixpkgs-registry
    jotunnNixosModules.enable-flakes

    jotunnNixosModules.bluetooth

    jotunnNixosModules.hardening

    jotunnNixosModules.basic-users

    jotunnNixosModules.power-utils
    jotunnNixosModules.laptop

    jotunnNixosModules.gui
    jotunnNixosModules.gnome-keyring

    jotunnNixosModules.audio

    # network config and tailscale
    jotunnNixosModules.systemd-resolved
    jotunnNixosModules.tailscale

    jotunnNixosModules.livestreaming
    ];
  }
