{
  description = "A package in Jotunn";

  outputs = { self, nixpkgs, flake-utils }: let
    packageName = "jotunn-example";
  in
    (flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      thisPackage = pkgs.callPackage (./default.nix) { };
    in {
      packages = {
        ${packageName} = thisPackage;
      };
      packages.default = thisPackage;
    }));
}
