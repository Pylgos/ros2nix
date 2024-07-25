{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_testing,
  launch_testing_ament_cmake,
  launch_testing_ros,
  rclcpp,
  rclcpp_components,
  rcutils,
  rmw_implementation_cmake,
  rosidl_cmake,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    logging_demo = substituteSource {
      src = fetchgit {
        name = "logging_demo-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "357a067af0e40935e80b8d446576cb894207d4bf";
        hash = "sha256-mJwLf7atoED8ANKam26pgqZkCENfLPM3pCYey7bb3iY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "logging_demo";
  version = "0.20.4-1";
  src = sources.logging_demo;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [ rosidl_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_components rcutils rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
