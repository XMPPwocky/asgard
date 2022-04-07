{ config, lib, ... }:
{
  hardware.bluetooth.enable = lib.mkIf config.yggdrasil.enableGaming true;
}
