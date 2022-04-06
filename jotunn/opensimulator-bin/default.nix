{ lib, mono5, stdenv, fetchzip, pkgs, ... }:
stdenv.mkDerivation rec {
  name = "opensimulator-bin";

  src = fetchzip {
    url = "http://opensimulator.org/dist/opensim-0.9.2.1.tar.gz";
    hash = "sha256-OLSKFeuA6cPjkcGrQIQXF60yUOHsQsR/1yG5BR7zAMs=";
  };

  runnerScript = pkgs.writeScriptBin "opensim" ''${mono5}/bin/mono ${src}/bin/OpenSim.exe'';

  buildInputs = [ mono5 ];

  installPhase = ''
    mkdir -p $out/bin;
    ln -s $runnerScript/bin/opensim $out/bin/opensim
  '';
}
