{
  inputs.flake-utils.url = "github:numtide/flake-utils";

  inputs.jotunn.url = "path:./jotunn";

  outputs = { self, flake-utils, jotunn }:
  {
    nixosModules = import ./nixos/modules/default.nix // {
      homeConfigurations = import ./home-manager-cfg/default.nix;
    };
  } // (flake-utils.lib.eachDefaultSystem (system:
    {
        packages = jotunn.packages.${system};
    }));
}
