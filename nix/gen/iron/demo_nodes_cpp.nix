{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  launch_testing,
  launch_testing_ament_cmake,
  launch_testing_ros,
  launch_xml,
  rcl_interfaces,
  rclcpp,
  rclcpp_components,
  rcutils,
  rmw,
  rmw_implementation_cmake,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    demo_nodes_cpp = substituteSource {
      src = fetchgit {
        name = "demo_nodes_cpp-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "aff8636adc1ba5441a18f447be5a35b34d5fedd7";
        hash = "sha256-wi937JAPnXxvUHg3FP5oVFV6l3ZKiOmCerAYOJ8qYGk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "demo_nodes_cpp";
  version = "0.27.1-1";
  src = sources.demo_nodes_cpp;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ launch_xml rmw rmw_implementation_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces launch_ros rcl_interfaces rclcpp rclcpp_components rcutils std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
