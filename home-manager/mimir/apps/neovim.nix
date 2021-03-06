{ pkgs, ... }:
{
  programs.neovim = {
    vimAlias = true;

    withPython3 = true;
    withNodeJs = true;

    plugins = with pkgs.vimPlugins; [
      coc-nvim
      coc-python
      coc-json
      rust-vim
    ];

    extraPackages = with pkgs; [
      nixpkgs-fmt
      rnix-lsp
    ];

    coc.enable = false;

    coc.settings = {
      languageserver.nix = {
        command = "rnix-lsp";
        filetypes = [ "nix" ];
      };
    };

    extraConfig = (builtins.readFile ../dotfiles/neovim/init_extra.vim);
  };
}
