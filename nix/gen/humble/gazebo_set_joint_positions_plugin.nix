{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo_dev,
  gazebo_ros,
  gazebo_ros_pkgs,
  joint_state_publisher,
  launch_testing_ament_cmake,
  rclcpp,
  robot_state_publisher,
  ros2launch,
  sensor_msgs,
  std_msgs,
  substituteSource,
  urdf,
  xacro,
}:
let
  sources = rec {
    gazebo_set_joint_positions_plugin = substituteSource {
      src = fetchgit {
        name = "gazebo_set_joint_positions_plugin-source";
        url = "https://github.com/ros2-gbp/gazebo_set_joint_positions_plugin-release.git";
        rev = "057114a1346a5ff5fec6ece2694e955efcf152df";
        hash = "sha256-t//mNnCSd1MnhbIk0z3RcMs/6k8je8YLagBZADq7XJM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gazebo_set_joint_positions_plugin";
  version = "1.0.3-1";
  src = sources.gazebo_set_joint_positions_plugin;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gazebo_dev gazebo_ros rclcpp sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
