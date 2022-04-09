{ config, pkgs, ... }:

let mySshKeys = [
  "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKSSO3tl4X3BTyElu1wwZKdUrn6Q5ftlp1w1KsSTgWn9G013ahqSIZPTpsEbE4lAAySNpR0+N71hZDZ8MwhxZ2A= YubiKey #16944251 PIV Slot 9a"
]; in

{
  imports =
    [ # Include the results of the hardware scan.
      <nixpkgs/nixos/modules/profiles/hardened.nix>
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_hardened;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  networking.interfaces.enp2s0.useDHCP = true;

  i18n.defaultLocale = "en_US.UTF-8";

  users.users.mimir = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  security.sudo.wheelNeedsPassword = false;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.tailscale = { enable = true; };

  # mount share from unraid host-
  fileSystems."/mnt/unraid/nixos_vm" = {
    fsType = "9p";
    device = "shares_unraid";
    options = [ "trans=virtio" ];
  };
        

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?
}
