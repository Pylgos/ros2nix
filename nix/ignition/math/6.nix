{ callPackage, ignition-cmake2, ... } @ args :

callPackage ./. ({
  majorVersion = "6";
  version = "6.13.0";
  srcSha256 = "sha256-4kWbHdsDCCEgXHy3Dv4oZKdVBY4eJLKovYu+HUgkSjE=";
  ignition-cmake = ignition-cmake2;
} // args)
