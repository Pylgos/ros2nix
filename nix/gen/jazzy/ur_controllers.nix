{
  ament_cmake,
  angles,
  buildRosPackage,
  controller_interface,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_trajectory_controller,
  lifecycle_msgs,
  pluginlib,
  rclcpp_lifecycle,
  rcutils,
  realtime_tools,
  std_msgs,
  std_srvs,
  substituteSource,
  ur_dashboard_msgs,
  ur_msgs,
}:
let
  sources = rec {
    ur_controllers = substituteSource {
      src = fetchgit {
        name = "ur_controllers-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "1113bc1df41a64ad851721b31dd71a9788b6edf3";
        hash = "sha256-DzKXQV8Q+0ZYkzYGT/dFT5q2w7PiDSn9C/zSI6fqbvc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur_controllers";
  version = "2.4.5-1";
  src = sources.ur_controllers;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles controller_interface joint_trajectory_controller lifecycle_msgs pluginlib rclcpp_lifecycle rcutils realtime_tools std_msgs std_srvs ur_dashboard_msgs ur_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
