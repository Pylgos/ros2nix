{
  action_msgs,
  ament_cmake_gen_version_h,
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
        rev = "9a1b91aff7fe4581b0b140808d61e633c60bb35c";
        hash = "sha256-69FfdjoDVJGaXs15bcI8RewOkV6tvdsO0cbVdfdeh6Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl_action";
  version = "9.4.0-1";
  src = sources.rcl_action;
  nativeBuildInputs = [ ament_cmake_gen_version_h ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs rcl rcutils rmw rosidl_runtime_c ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
