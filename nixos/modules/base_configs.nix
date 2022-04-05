{ jotunnNixosModules, home-manager, pkgs, system, flake-utils, ... }:
{
  baselineUnstableLaptop = [
    { config = {
      environment.systemPackages = [ pkgs.git ];
      nixpkgs.config.nixpkgs-branch = "nixos-unstable";

      networking.networkmanager.enable = true;

      networking.firewall.enable = true;
      networking.firewall.checkReversePath = true;

      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;

    };}

    (import ../machines/mimir-nixos-fw/configuration.nix)

    jotunnNixosModules.nixpkgs-registry
    jotunnNixosModules.enable-flakes

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
