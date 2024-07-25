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
  rcl,
  rcl_interfaces,
  rclcpp,
  rclcpp_components,
  rcpputils,
  rcutils,
  rmw,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    demo_nodes_cpp = substituteSource {
      src = fetchgit {
        name = "demo_nodes_cpp-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "f2ec704db4372371e8afbc5d5f16c31a11297cbc";
        hash = "sha256-SEOcZ70jl1qTd0LtHKyKu7y18cPrll/MNpJKUs4brTI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "demo_nodes_cpp";
  version = "0.34.1-1";
  src = sources.demo_nodes_cpp;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces launch_ros launch_xml rcl rcl_interfaces rclcpp rclcpp_components rcpputils rcutils rmw std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
