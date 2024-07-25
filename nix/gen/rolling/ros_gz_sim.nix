{
  ament_cmake,
  ament_cmake_python,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gflags,
  gz_math_vendor,
  gz_msgs_vendor,
  gz_sim_vendor,
  gz_transport_vendor,
  launch,
  launch_ros,
  launch_testing,
  launch_testing_ament_cmake,
  pkg-config,
  rclcpp,
  rclcpp_components,
  std_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    ros_gz_sim = substituteSource {
      src = fetchgit {
        name = "ros_gz_sim-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "d412b4d7e61e28ba72aad626e02b6390345d8a0d";
        hash = "sha256-b9nf4cUX+jlAgjO7qrfO+kqwKKAF7VA9z+lckqeMoZM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_gz_sim";
  version = "1.0.1-1";
  src = sources.ros_gz_sim;
  nativeBuildInputs = [ ament_cmake ament_cmake_python pkg-config wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_python launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gflags gz_math_vendor gz_msgs_vendor gz_sim_vendor gz_transport_vendor launch_ros rclcpp rclcpp_components std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
