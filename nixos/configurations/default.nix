{pkgs, ...}@inputs:
{
  mimir-nixos-fw = pkgs.callPackage ./mimir-nixos-fw.nix inputs;
  test-vm = pkgs.callPackage ./test-vm.nix inputs;
}
