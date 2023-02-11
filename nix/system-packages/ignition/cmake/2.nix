{ callPackage, ... } @ args :

callPackage ./. ({
  majorVersion = "2";
  version = "2.16.0";
  srcSha256 = "sha256-QiExRbIN/CtzB+jOknJokDxyqQGdkZQvVABJumYNCFI=";
} // args)
