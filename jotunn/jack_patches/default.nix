{ self, pkgs, ... }:
pkgs.fetchurl {
  name = "jack-patches";
  url = "file://${self}/jack_patches";
}
