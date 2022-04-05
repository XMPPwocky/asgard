{
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
  {
    nixosModules = import ./nixos/modules/default.nix;
  };
}
