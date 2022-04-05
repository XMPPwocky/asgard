{ lib, config, pkgs, ... }:

{
  system.stateVersion = "21.05";

  imports = [
    ./hardware-configuration.nix
  ];

  services.flatpak.enable = true;

  services.fprintd.enable = false;
  services.pcscd.enable = true;
  services.yubikey-agent.enable = true;
  services.fwupd.enable = true;
  services.ratbagd.enable = true;

  security.sudo.wheelNeedsPassword = false;

  security.allowUserNamespaces = true;
  boot.kernel.sysctl."kernel.unprivileged_userns_clone" = 1;
}
