{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_flake8,
  ament_cmake_lint_cmake,
  ament_cmake_pep257,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  control_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot_create_msgs,
  irobot_create_toolbox,
  nav_msgs,
  rclcpp,
  rclcpp_action,
  rcutils,
  ros_ign_interfaces,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
}:
let
  sources = rec {
    irobot_create_ignition_toolbox = substituteSource {
      src = fetchgit {
        name = "irobot_create_ignition_toolbox-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "51ee88435f72c2c0551a0a9812baf260267bd5ef";
        hash = "sha256-45d/oiXqVU4VP7u7Gi5X/RuYeWy+jps+ZZcVi5tMhuM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "irobot_create_ignition_toolbox";
  version = "2.1.0-1";
  src = sources.irobot_create_ignition_toolbox;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ control_msgs irobot_create_msgs irobot_create_toolbox nav_msgs rclcpp rclcpp_action rcutils ros_ign_interfaces sensor_msgs std_msgs tf2 tf2_geometry_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
