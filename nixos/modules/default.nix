{
  enable-flakes = import ./enable-flakes.nix;
  nixpkgs-registry = import ./nixpkgs-registry.nix;

  hardening = import ./hardening.nix;

  basic-users = import ./basic-users.nix;

  laptop = import ./laptop.nix;

  gui = import ./gui.nix;
  systemd-resolved = import ./systemd-resolved.nix;
  audio = import ./audio.nix;
  alsa-lib-git = import ./alsa-lib-git.nix;
  tailscale = import ./tailscale.nix;

  power-utils = import ./power-utils.nix;

  ps5-controller-udev = import ./ps5-controller-udev.nix;
  steam = import ./steam.nix;

  bluetooth = import ./bluetooth.nix;

  gnome-keyring = import ./gnome-keyring.nix;

  ledger = import ./ledger.nix;

  livestreaming = import ./livestreaming.nix;
}
