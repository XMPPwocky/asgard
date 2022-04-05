{ asgard, home-manager, pkgs, system, flake-utils, ... }:
  let asgardModules = (pkgs.callPackage asgard { inherit flake-utils; });
in {
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

    (import ./machines/mimir-nixos-fw/configuration.nix)

    asgardModules.nixpkgs-registry
    asgardModules.enable-flakes

    asgardModules.hardening

    asgardModules.basic-users

    asgardModules.power-utils
    asgardModules.laptop

    asgardModules.gui
    asgardModules.gnome-keyring

    asgardModules.audio

    # network config and tailscale
    asgardModules.systemd-resolved
    asgardModules.tailscale

    asgardModules.livestreaming
    ];
  }
