inputs@{pkgs, nixpkgs, ...}:
{
  mimir-nixos-fw = pkgs.callPackage ./mimir-nixos-fw.nix inputs;
  test-vm = pkgs.callPackage ./test-vm.nix { inherit nixpkgs; system = "x86_64-linux"; };
}
