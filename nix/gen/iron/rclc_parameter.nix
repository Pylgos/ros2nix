{
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  osrf_testing_tools_cpp,
  rcl,
  rcl_interfaces,
  rclc,
  rclcpp,
  rcutils,
  rosidl_runtime_c,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    rclc_parameter = substituteSource {
      src = fetchgit {
        name = "rclc_parameter-source";
        url = "https://github.com/ros2-gbp/rclc-release.git";
        rev = "dab812fb2b328a8e704b0943fe3199520cb6a4d4";
        hash = "sha256-VSaO/dnianUHTwu2mdvPKpFZag4ASsWosbT1/Dp1BUc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclc_parameter";
  version = "5.0.1-1";
  src = sources.rclc_parameter;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rcl rcl_interfaces rclc rcutils rosidl_runtime_c ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
