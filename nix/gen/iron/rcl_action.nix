{
  action_msgs,
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  osrf_testing_tools_cpp,
  rcl,
  rcutils,
  rmw,
  rmw_implementation_cmake,
  rosidl_runtime_c,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    rcl_action = substituteSource {
      src = fetchgit {
        name = "rcl_action-source";
        url = "https://github.com/ros2-gbp/rcl-release.git";
        rev = "1c7813e384a40792adb099e5ea2476e4fe212f31";
        hash = "sha256-9/isoHdByMtcJefwrUJ+geI4bV1XfdlicOZ/jBZqpRA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl_action";
  version = "6.0.5-1";
  src = sources.rcl_action;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ rmw ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs rcl rcutils rosidl_runtime_c ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
