{
  ament_cmake,
  buildRosPackage,
  etsi_its_cam_conversion,
  etsi_its_denm_conversion,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  ros_environment,
  std_msgs,
  substituteSource,
  udp_msgs,
}:
let
  sources = rec {
    etsi_its_conversion = substituteSource {
      src = fetchgit {
        name = "etsi_its_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "b4211c89661a0ed48b2811f49637680004692f41";
        hash = "sha256-KEJOw8zGW2EExhZPx5CsBzIBg5k2hgE3sbE1DQNL1ik=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "etsi_its_conversion";
  version = "2.0.2-1";
  src = sources.etsi_its_conversion;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ etsi_its_cam_conversion etsi_its_denm_conversion rclcpp rclcpp_components std_msgs udp_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
