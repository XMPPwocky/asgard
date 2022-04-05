{ pkgs, lib, config, ... }: {
  options = {
    yggdrasil.useGUIDesktop = lib.mkEnableOption { default = false; };
  };

  config = {
    home.packages = with pkgs; [
      git # we really want to make sure to keep git around for nixos-rebuild flake stuff
    ];
  };
}
