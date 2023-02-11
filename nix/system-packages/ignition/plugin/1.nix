{ callPackage, ignition, ... } @ args :

callPackage ./. ({
  majorVersion = "1";
  version = "1.3.0";
  srcSha256 = "sha256-5Sw0ScMo+nTETQCF6hgcIB09suYWmut0GQpLrSMugPU=";
  ignition-cmake = ignition-cmake2;
} // args)
