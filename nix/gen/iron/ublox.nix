{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  ublox_gps,
  ublox_msgs,
  ublox_serialization,
}:
let
  sources = rec {
    ublox = substituteSource {
      src = fetchgit {
        name = "ublox-source";
        url = "https://github.com/ros2-gbp/ublox-release.git";
        rev = "009acce31308a7aecfe720fc56398b249fc76418";
        hash = "sha256-tCPY6Wu0TQ0Auvkx3xW6yyreMV7K0GruiyS4AZ29LtI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ublox";
  version = "2.3.0-3";
  src = sources.ublox;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ublox_gps ublox_msgs ublox_serialization ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
