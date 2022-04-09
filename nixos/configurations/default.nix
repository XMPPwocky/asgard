{ ... }:
{
  mimir-nixos-fw = import ./mimir-nixos-fw.nix;
  test-vm = import ./test-vm.nix;
}
