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
  rmw_fastrtps_cpp,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    demo_nodes_cpp_native = substituteSource {
      src = fetchgit {
        name = "demo_nodes_cpp_native-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "9c71b2a8d22e136e8e9262be7e5a817712807ca2";
        hash = "sha256-Elx+PtHWG8VX8ukj/8Exw+n7cr/FmWXCosc9jPyewio=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "demo_nodes_cpp_native";
  version = "0.20.4-1";
  src = sources.demo_nodes_cpp_native;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_components rmw_fastrtps_cpp std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
