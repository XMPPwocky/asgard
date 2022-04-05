# For a Framework laptop

{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/e63b1c08-8741-4dd9-b282-843a51a46b01";
      fsType = "btrfs";
      options = [ "relatime" "nodiratime" "discard=async" "compress=zstd:1" ];
    };

  boot.initrd.luks.devices."cryptroot".device = "/dev/disk/by-uuid/d0a95925-7a84-45df-95e6-f08c29750ed8";
  boot.initrd.luks.devices."cryptswap".device = "/dev/disk/by-uuid/668a991e-5717-4dfe-b085-1db3b72958a5";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/7B31-BA35";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/93fe59eb-c77f-41e4-9a6d-9c6adfdcc9cb"; }
    ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  # high-resolution display
  hardware.video.hidpi.enable = lib.mkDefault true;

  # Bootloader config
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  nixpkgs.config.allowUnfree = true;
  hardware.cpu.intel.updateMicrocode = true;
  hardware.enableAllFirmware = true;

  boot.kernelParams = [
    "i915.enable_fbc=1"
    "i915.enable_psr=1"
    "i915.enable_guc=2"
    "mem_sleep_default=s2idle"
  ];
  boot.extraModprobeConfig = lib.mkMerge [
    "options iwlwifi power_save=1"
  ];

  ### OpenGL stuff and libva
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [ intel-media-driver vaapiIntel ];
    driSupport32Bit = true;
  };
  environment.sessionVariables.LIBVA_DRIVER_NAME = "iHD";

}
