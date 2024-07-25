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
    off_highway_uss_msgs = substituteSource {
      src = fetchgit {
        name = "off_highway_uss_msgs-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "b1779304fa3ae72e8b338adb42884845deff0f17";
        hash = "sha256-BNvO9OLeIYugbjBzXyTDCo5idaNIPHv1jClUR4L/BNM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "off_highway_uss_msgs";
  version = "0.6.2-1";
  src = sources.off_highway_uss_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
