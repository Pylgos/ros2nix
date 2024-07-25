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
        rev = "e3fc0eea7adec107364621a21fe73279d58f9e92";
        hash = "sha256-4k2hongdPNJp+GLUdtu3mF/43cWmEvdfi2GJy1LifNg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur_controllers";
  version = "2.3.9-1";
  src = sources.ur_controllers;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles controller_interface joint_trajectory_controller lifecycle_msgs pluginlib rclcpp_lifecycle rcutils realtime_tools std_msgs std_srvs ur_dashboard_msgs ur_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
