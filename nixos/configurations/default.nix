inputs:
{
  mimir-nixos-fw = import ./mimir-nixos-fw.nix ({ system = "x86_64-linux"; } // inputs);
  test-vm = import ./test-vm.nix ({ system = "x86_64-linux"; } // inputs);
}
