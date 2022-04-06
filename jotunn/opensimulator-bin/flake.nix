{
  description = "A package in Jotunn";

  outputs = { self, nixpkgs, flake-utils }:
    (flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      thisPackage = pkgs.callPackage (./default.nix) { };
    in {
      packages = {
        thisPackage.name = thisPackage;
      };
      packages.default = thisPackage;
    }));
}
