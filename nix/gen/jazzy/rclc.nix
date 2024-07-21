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
        rev = "b34236539056dee4ec3a309c0c3a4c8db6ebd383";
        hash = "sha256-A49/yUw6gCxZpDhW8qijU7K6AFuP1R5dzLhqDvefndA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclc";
  version = "6.1.0-3";
  src = sources.rclc;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_ros rosidl_generator_c ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcl rcl_action rcutils rosidl_typesupport_c ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
