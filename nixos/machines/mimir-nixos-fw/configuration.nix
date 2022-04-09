# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  swapDevices =
    [ { device = "/dev/disk/by-uuid/93fe59eb-c77f-41e4-9a6d-9c6adfdcc9cb"; }
    ];

  system.stateVersion = "22.05"; # Did you read the comment?
}
