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
        rev = "8bd6a55445c8ca870effbc17606e7906b807deae";
        hash = "sha256-PuPPRJok17nAPVtHi5o4xSIvqAu49/e9Y+9NrN1dKNM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl_action";
  version = "5.3.8-1";
  src = sources.rcl_action;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ rmw ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs rcl rcutils rosidl_runtime_c ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
