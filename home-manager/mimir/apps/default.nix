{ lib, ... }: {
  imports = [
    ./alacritty.nix
    ./tmux.nix

    ./neovim.nix

    ./bitwig.nix
    ./element-desktop.nix
    ./firefox.nix
    ./zotero.nix
  ];
}
