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
        rev = "22698722e136d4235d90c9ec3bcbfc42637a051d";
        hash = "sha256-IJL1GP05J/NOq8PYmUw6I3Tmf0a4E20EJmvve3VGwCM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "demo_nodes_cpp_native";
  version = "0.34.1-1";
  src = sources.demo_nodes_cpp_native;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_components rmw_fastrtps_cpp std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
