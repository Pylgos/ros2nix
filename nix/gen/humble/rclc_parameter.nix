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
        rev = "4981a19d8812cfa6ad12dd9f9a0999164daa0f37";
        hash = "sha256-hNrMl0ZtfBDAADc2AGZnof1swDjvr50+cLUgVoq4w6c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclc_parameter";
  version = "4.0.2-3";
  src = sources.rclc_parameter;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rcl rcl_interfaces rclc rcutils rosidl_runtime_c ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
