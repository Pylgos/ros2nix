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
        rev = "c6bf3c71b603d48e4c33f91dbf819eb0c7808267";
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
