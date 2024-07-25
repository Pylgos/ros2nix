{
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_testing,
  osrf_testing_tools_cpp,
  rcl,
  rcl_action,
  rclcpp,
  rclcpp_action,
  rcutils,
  rosidl_generator_c,
  rosidl_typesupport_c,
  std_msgs,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    rclc = substituteSource {
      src = fetchgit {
        name = "rclc-source";
        url = "https://github.com/ros2-gbp/rclc-release.git";
        rev = "25bc6fbb62bfed5e0a1d702b85326f4d9db74ff7";
        hash = "sha256-/6Mwlb8boHDUDsZkin5GbzpBsFwzGTtaF/lvHXmtc3E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclc";
  version = "5.0.1-1";
  src = sources.rclc;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ rosidl_generator_c ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcl rcl_action rcutils rosidl_typesupport_c ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
