{ pkgs, lib, config, ... }:
{
  options.yggdrasil.nixpkgs-branch = lib.mkOption { default = "nixos"; };

  config.nix.registry.nixpkgs.from = { id = "nixpkgs"; type = "indirect"; };
  config.nix.registry.nixpkgs.to = {
    type = "github";
    owner = "NixOS";
    repo = "nixpkgs";
   ref = config.yggdrasil.nixpkgs-branch;
  };
}
