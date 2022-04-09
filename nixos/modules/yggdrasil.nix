{ config, lib, pkgs, ...}:
{
  options.yggdrasil = with lib; {
    enableBluetooth = mkEnableOption { };
    enableDesktop = mkEnableOption { };
    enableGaming = mkEnableOption { };
    enableMusicProduction = mkEnableOption { };
    enableWorkstation = mkEnableOption { };
  };

  config = with lib; mkMerge [
    (mkIf config.yggdrasil.enableGaming {
      programs.steam.enable = true;
    })

    (mkIf config.yggdrasil.enableDesktop {
      services.flatpak.enable = true;
      services.pcscd.enable = true;
      services.yubikey-agent.enable = true;
      services.fwupd.enable = true;
      services.ratbagd.enable = true;

      security.sudo.wheelNeedsPassword = false;

      security.allowUserNamespaces = true;
      boot.kernel.sysctl."kernel.unprivileged_userns_clone" = 1;
    })];
}
