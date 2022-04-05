{ pkgs, ... }: {
  config = {
    home.packages = with pkgs; [
      git # we really want to make sure to keep git around for nixos-rebuild flake stuff
    ];
    
  };
  imports = [
      ../apps/tmux.nix
      ../apps/alacritty.nix
      ../apps/neovim.nix

      ../apps/nixops.nix

      #../apps/resilio.nix
      #../apps/duplicacy-web.nix

      ../apps/chromium.nix
      ../apps/firefox.nix

      ../apps/signal-desktop.nix
      ../apps/element-desktop.nix

      #../apps/bitwig.nix
  ];
}
