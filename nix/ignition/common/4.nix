{ callPackage, ignition, ... } @ args :

callPackage ./. ({
  majorVersion = "4";
  version = "4.5.2";
  srcSha256 = "sha256-waWxSSKjq2K5YIOv2PaZmp/9Vv9rtDsE5QMM8+bvsks=";
  ignition-cmake = ignition-cmake2;
  ignition-math = ignition-math6;
  ignition-utils = ignition-utils1;
} // args)
