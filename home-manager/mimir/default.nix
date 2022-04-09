{ config, lib, pkgs, ... }:
{
  options.yggdrasil-home = {
    srcRoot = lib.mkOption {
      default = "${config.home.homeDirectory}/src/yggdrasil";
      type = lib.types.path;
    };
    systemConfig = lib.mkOption { type = lib.types.attrs; };
  };

  imports = [
    ../cfg-defaults.nix

    ./apps

    profiles/base.nix
  ];

  config = {
    programs.home-manager.enable = true;

    nixpkgs.config = {
      allowUnfree = true;
    };

    # workaround for weird issue that seems related to
    # https://github.com/nix-community/home-manager/issues/1118
    fonts.fontconfig.enable = lib.mkForce false;
    
    programs.neovim.enable = true;

    home.packages = (with pkgs; [
      fd
      ripgrep
      mosh

      discord
      tdesktop

      plexamp
      joplin-desktop

      libreoffice

      resilio-sync

      plasma-pa
      ark

      pinentry-qt

      mixxx

      #(pkgs.config.customPackages.binaryninja.makeBinjaWrapper { binaryNinjaPath = "/home/mimir/binaryninja"; extraPythonPackages = (p: [ p.colorama p.scapy ]); })

      sshfs
    ]);

    programs.bash.enable = true;

    programs.git = {
      enable = true;
      userName = "Mimir";
      userEmail = "mimir@xmppwocky.net";
      extraConfig = {
        init.defaultBranch = "main";
        core.hooksPath = "${config.yggdrasil-home.srcRoot}/meta/git-hooks";
      };
    };

    xsession.enable = true;
    xsession.windowManager.i3 = {
      enable = true;
      config = {
        terminal = "${pkgs.alacritty}/bin/alacritty";
        modifier = "Mod4";

        bars = [ {
          fonts.size = 10.0;
        }];
      };
      extraConfig = ''
  # Don’t treat Plasma pop-ups as full-sized windows
  for_window [class="plasmashell"] floating enable

  # Don’t spawn an empty window for the Plasma Desktop
  for_window [title="Desktop — Plasma"] kill, floating enable, border none

  # Don’t let notifications and non-interactive pop-up windows steal focus
  no_focus [class="plasmashell" window_type="notification"]
  no_focus [class="plasmashell" window_type="on_screen_display"]
       '';
    };
    xresources.properties."Xft.dpi" = 160;
    services.picom.enable = true;
  };
}
