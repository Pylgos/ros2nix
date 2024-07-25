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
        rev = "0c8c42943b44d311dc2344f9cfa8f333789bcaa0";
        hash = "sha256-FxbUjN3Zdn811R7d7Oky7DZXlX3m2cwU5dGy9wkSRlc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur_controllers";
  version = "2.2.14-1";
  src = sources.ur_controllers;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles controller_interface joint_trajectory_controller lifecycle_msgs pluginlib rclcpp_lifecycle rcutils realtime_tools std_msgs std_srvs ur_dashboard_msgs ur_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
