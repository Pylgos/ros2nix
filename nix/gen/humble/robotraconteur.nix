{
  bluez,
  buildPackages,
  buildRosPackage,
  cmake,
  dbus,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest,
  libusb1,
  openssl,
  python3,
  python3Packages,
  substituteSource,
  zlib,
}:
let
  sources = rec {
    robotraconteur = substituteSource {
      src = fetchgit {
        name = "robotraconteur-source";
        url = "https://github.com/robotraconteur-packaging/robotraconteur-ros2-release.git";
        rev = "3844bd631328a624b2f3d93b98f530449e61ef9e";
        hash = "sha256-2lPEFNML+T0ltgs4RHORxPTCY9Nc5j/mABPJXRQ5WF0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "robotraconteur";
  version = "1.1.1-1";
  src = sources.robotraconteur;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ python3 buildPackages.python3Packages.numpy buildPackages.python3Packages.setuptools ];
  buildInputs = [  ];
  propagatedBuildInputs = [ bluez dbus libusb1 openssl python3Packages.boost zlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
