{
  inputs = {
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    jotunn.url = "path:./jotunn";
  };

  outputs = { self, nixpkgs, flake-utils, jotunn, home-manager }:
    let
      nixosModules = import ./nixos/modules/default.nix;
      homeConfigurations = import ./home-manager/default.nix;

      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      nixosModulesBuilt = builtins.mapAttrs (k: v: pkgs.callPackage v { inherit flake-utils jotunn home-manager; jotunnNixosModules = nixosModules; }) nixosModules;
      base-configs = nixosModulesBuilt.base-configs;

      homeConfigurationsBuilt = pkgs.callPackage ./home-manager/default.nix { };

      nixosConfigurations = pkgs.callPackage ./nixos/configurations/default.nix { inherit nixosModules home-manager nixpkgs base-configs flake-utils; homeConfigurations = homeConfigurationsBuilt; };
    in
    {
      inherit nixosModules;

      nixosConfigurations.mimir-nixos-fw = nixosConfigurations.mimir-nixos-fw;
      nixosConfigurations.test-vm = nixosConfigurations.test-vm;
    } // (flake-utils.lib.eachDefaultSystem (system:
      {
        packages = jotunn.packages.${system};
      }));
}
