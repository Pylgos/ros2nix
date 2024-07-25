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
  angles,
  buildRosPackage,
  control_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  irobot_create_msgs,
  irobot_create_toolbox,
  nav_msgs,
  python3Packages,
  rclcpp,
  rclcpp_action,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    irobot_create_nodes = substituteSource {
      src = fetchgit {
        name = "irobot_create_nodes-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "2b7b267706218bfcfd2103af5cdb589a165cccf1";
        hash = "sha256-Cr1nAo4G7H5nAcW5zRMzQ+q/LoKdWZbqPlpnb1BXbKU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "irobot_create_nodes";
  version = "2.1.0-1";
  src = sources.irobot_create_nodes;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles control_msgs geometry_msgs irobot_create_msgs irobot_create_toolbox nav_msgs python3Packages.boost rclcpp rclcpp_action rclcpp_components sensor_msgs tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
