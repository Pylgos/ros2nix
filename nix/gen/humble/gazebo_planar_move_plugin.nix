{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo_dev,
  gazebo_ros,
  geometry_msgs,
  launch_testing_ament_cmake,
  nav_msgs,
  python3Packages,
  rclcpp,
  robot_state_publisher,
  ros2launch,
  sensor_msgs,
  substituteSource,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    gazebo_planar_move_plugin = substituteSource {
      src = fetchgit {
        name = "gazebo_planar_move_plugin-source";
        url = "https://github.com/ros2-gbp/gazebo_planar_move_plugin-release.git";
        rev = "ac085156b2eb749d0f0e771d7f0d3c36abb2492f";
        hash = "sha256-yRmP/kg25x7GTVueWKKQ5hQPD1yt50pJMVSh9MBRuLo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gazebo_planar_move_plugin";
  version = "1.0.2-1";
  src = sources.gazebo_planar_move_plugin;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gazebo_dev gazebo_ros geometry_msgs nav_msgs python3Packages.boost rclcpp sensor_msgs tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
