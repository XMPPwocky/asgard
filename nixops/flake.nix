{
  outputs = { self, nixpkgs }: {
    nixopsConfigurations.default = {
      inherit nixpkgs;

      network.description = "Home infrastructure";
      network.storage.legacy = {};

      host = { config, pkgs, lib, ... }: {
        config.nixpkgs.config.allowUnfree = true;
        config.services.minecraft-server = {
          enable = true;
          openFirewall = true;
          declarative = true;
          eula = true;

          whitelist = {
            it_is_mimir = "dd737999-4da6-478c-93cb-f4eaaa7eec54";
            Rainskyriver = "d934bcb9-51de-4cda-8b5d-ae1cbbc9b109";
            AcidCasualty = "7795c66c-8688-4b1f-ba29-d61d33297585";
            HitoriKitsu = "cf664486-e675-466b-b60f-3fbfd25065ce";
          };

          jvmOpts = "-Xmx1536M -Xms1536M";
        };
      };
    };
  };
}
