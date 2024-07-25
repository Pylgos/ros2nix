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
        rev = "32fffdba93eee710a486c0353aa2a5dae60e66ef";
        hash = "sha256-0BPgy6S53azNHrqcxx8wXjSaRXu4Cmb3mi4c/tPl9vk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur_controllers";
  version = "2.4.8-1";
  src = sources.ur_controllers;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles controller_interface joint_trajectory_controller lifecycle_msgs pluginlib rclcpp_lifecycle rcutils realtime_tools std_msgs std_srvs ur_dashboard_msgs ur_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
