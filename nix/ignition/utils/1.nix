{ callPackage, ignition, ... } @ args :

callPackage ./. ({
  majorVersion = "1";
  version = "1.4.0";
  srcSha256 = "sha256-+kV/iYA1XmMpgK6G4Q69uT1ZZexVAphX6mD5SRQGI7k=";
  ignition-cmake = ignition.cmake2;
} // args)
