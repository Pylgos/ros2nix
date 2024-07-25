{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  mimick_vendor,
  performance_test_fixture,
  rcl,
  rcl_interfaces,
  rcl_lifecycle,
  rclcpp,
  rcpputils,
  rcutils,
  rmw,
  rosidl_typesupport_cpp,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    rclcpp_lifecycle = substituteSource {
      src = fetchgit {
        name = "rclcpp_lifecycle-source";
        url = "https://github.com/ros2-gbp/rclcpp-release.git";
        rev = "2057680cd23c05037e3127d79130c78bea223e6e";
        hash = "sha256-zmx6cZEpJC+0RB+SYU1Wr0yrCkN3jBJB86ryXzI+61g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclcpp_lifecycle";
  version = "21.0.6-1";
  src = sources.rclcpp_lifecycle;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ rmw ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lifecycle_msgs rcl rcl_interfaces rcl_lifecycle rclcpp rcutils rosidl_typesupport_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
