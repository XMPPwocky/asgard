{
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    {
    nixosModules = import ./nixos/modules/default.nix;
    } //
  (flake-utils.eachDefaultSystem system: packages.jack-patches = pkgs.fetchurl {
      name = "jack-patches";
      url = "file://${self}/jack_patches";
    });
}
