{ pkgs, ... }:
{
  services.xserver.enable = true;

  services.xserver.desktopManager.xfce.enable = true;

  xdg.portal.enable = true;
}
