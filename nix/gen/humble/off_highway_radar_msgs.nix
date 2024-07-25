{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    off_highway_radar_msgs = substituteSource {
      src = fetchgit {
        name = "off_highway_radar_msgs-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "c221ddc65210c7df2db52314cfaefb6fd31b36f4";
        hash = "sha256-nVjedsn9IhgT15nPtdKad9epaF7Q/ITY/xX8YMBmTL4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "off_highway_radar_msgs";
  version = "0.6.2-1";
  src = sources.off_highway_radar_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
