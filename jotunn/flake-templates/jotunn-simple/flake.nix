{
  description = "A package in Jotunn";

  outputs = { self, nixpkgs, flake-utils }: let
    packageName = "jotunn-example";
  {
    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.hello;

    (flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      thisPackage = pkgs.callPackage (./default.nix) { };
    in {
      packages = {
        ${packageName} = thisPackage;
      };
      defaultPackage = thisPackage;
    };


  };
}
