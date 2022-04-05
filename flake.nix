{
  inputs = {
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    jotunn.url = "path:./jotunn";
  };

  outputs = { self, nixpkgs, flake-utils, jotunn, home-manager }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      nixosModules = import ./nixos/modules/default.nix;
      homeConfigurations = import ./home-manager/default.nix;
      nixosConfigurations = pkgs.callPackage ./nixos/configurations/default.nix { inherit nixosModules homeConfigurations home-manager nixpkgs; };
    in
    {
      inherit nixosConfigurations;
    } // (flake-utils.lib.eachDefaultSystem (system:
      {
        packages = jotunn.packages.${system};
      }));
}
