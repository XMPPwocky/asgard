{ pkgs, ... }:
{
  users.mutableUsers = true;
  users.users.mimir = {
    isNormalUser = true;
    description = "Mimir";

    extraGroups = [ "audio" "jackaudio" "wheel" "networkmanager" "input" "plugdev" ];
  };
}
