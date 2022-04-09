{ config, lib, ... }:
{
  hardware.bluetooth.enable = lib.mkDefault config.yggdrasil.enableBluetooth;
}
