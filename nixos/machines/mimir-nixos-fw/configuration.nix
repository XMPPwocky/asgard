{ lib, config, pkgs, ... }:

{
  system.stateVersion = "21.05";

  imports = [
    ./hardware-configuration.nix
  ];

}
