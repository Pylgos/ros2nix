{ callPackage, ignition-cmake2, ignition-math6, ... } @ args :

callPackage ./. ({
  majorVersion = "7";
  version = "7.3.0";
  srcSha256 = "sha256-JiDpmpvgwEcSlybqtYBr49RaxHLLqIteC8jM+4H5tLI=";
  ignition-cmake = ignition-cmake2;
  ignition-math = ignition-math6;
} // args)
