{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  libusb1,
  substituteSource,
}:
let
  sources = rec {
    libphidget22 = substituteSource {
      src = fetchgit {
        name = "libphidget22-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "e2fa40aa4dc7c2067f0561e64757ad2e7524e466";
        hash = "sha256-6qmEwpvLQ3uNtKDMaZipmO91nKI98FLjFSl0zWR+tCk=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://www.phidgets.com/downloads/phidget22/libraries/linux/libphidget22/libphidget22-1.19.20240304.tar.gz";
          to = "URL ${libphidget22-vendor_source-libphidget22-1-0}";
        }
      ];
    };
    libphidget22-vendor_source-libphidget22-1-0 = substituteSource {
      src = fetchzip {
        name = "libphidget22-vendor_source-libphidget22-1-0-source";
        url = "https://www.phidgets.com/downloads/phidget22/libraries/linux/libphidget22/libphidget22-1.19.20240304.tar.gz";
        hash = "sha256-TQg72tGQsU7ygESyh3gR68l+RXNF4uDHR/tj5vVlXY0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libphidget22";
  version = "2.3.3-1";
  src = sources.libphidget22;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libusb1 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
