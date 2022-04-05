{
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    (flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      packages = {
        #jack-patch-helpers = pkgs.callPackage (./jack_patch_helpers) { };
      };
    })) // {
      templates = import ./flake-templates;
    };
}