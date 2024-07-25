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
        rev = "624a100e8ccd0d48dd5aaedfcc523ee07e193c65";
        hash = "sha256-8qdLDLT6h7+bkUz8SP4nxS0EGEM1VTuSOvqZX9RQITM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "logging_demo";
  version = "0.34.1-1";
  src = sources.logging_demo;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_components rcutils rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
