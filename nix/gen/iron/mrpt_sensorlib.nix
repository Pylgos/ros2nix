{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mrpt2,
  mrpt_msgs,
  rclcpp,
  rclcpp_components,
  ros_environment,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    mrpt_sensorlib = substituteSource {
      src = fetchgit {
        name = "mrpt_sensorlib-source";
        url = "https://github.com/ros2-gbp/mrpt_sensors-release.git";
        rev = "cf480e931d66fe12495f8b1eca1a15cc13477f68";
        hash = "sha256-J0y6+5LXV6w/rcob8bV2eBDxqiApTpx8CKkCQInnY+I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_sensorlib";
  version = "0.2.1-1";
  src = sources.mrpt_sensorlib;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint_auto ament_lint_common mrpt2 mrpt_msgs rclcpp rclcpp_components tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}