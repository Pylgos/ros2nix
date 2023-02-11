{ callPackage, ignition, ... } @ args :

callPackage ./. ({
  majorVersion = "5";
  version = "5.2.1";
  srcSha256 = "sha256-PPRZQq2RDTf08JFEn3JtMg3ksbGSuSzEPPFLs0SHY/Y=";
  ignition-cmake = ignition-cmake2;
  ignition-math = ignition-math6;
  ignition-common = ignition-common4;
  ignition-plugin = ignition-plugin1;
} // args)
