{ callPackage, ... } @ args :

callPackage ./. ({
  majorVersion = "2";
  version = "2.15.0";
  srcSha256 = "sha256-dIFohnHdLpZTjN53scKaZnpMt49XMpms2t+6chgIO4E=";
} // args)
