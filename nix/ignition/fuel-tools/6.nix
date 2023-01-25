{ callPackage, ignition, ... } @ args :

callPackage ./. ({
  majorVersion = "6";
  version = "6.2.0";
  srcSha256 = "sha256-w3yLAzD+/wtgC+PrMFcj337gYsCGO89YRuJoqLHZhyo=";
  ignition-cmake = ignition-cmake2;
  ignition-common = ignition-common4;
  ignition-msgs = ignition-msgs7;
} // args)
