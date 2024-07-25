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
        rev = "6273f4b1f0e03e2f2be7a290066974c69999f895";
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
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ etsi_its_cam_conversion etsi_its_denm_conversion rclcpp rclcpp_components std_msgs udp_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
