{ rustPlatform }:

rustPlatform.buildRustPackage {
  pname = "ros2nix-setup-helper";
  version = "0.1.0";
  src = ../setup-helper;
  cargoLock.lockFile = ../setup-helper/Cargo.lock;
}
