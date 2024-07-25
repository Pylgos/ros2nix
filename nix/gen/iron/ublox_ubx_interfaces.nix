{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  substituteSource,
}:
let
  sources = rec {
    ublox_ubx_interfaces = substituteSource {
      src = fetchgit {
        name = "ublox_ubx_interfaces-source";
        url = "https://github.com/ros2-gbp/ublox_dgnss-release.git";
        rev = "010b8d6fdc7eebf6878b772013fab2c1bb647065";
        hash = "sha256-GKe0RGAVTzo1s9aVoDdarKkspqxDfGs9JB6jM3JmrBo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ublox_ubx_interfaces";
  version = "0.5.3-1";
  src = sources.ublox_ubx_interfaces;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
