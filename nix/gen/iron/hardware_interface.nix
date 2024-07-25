{
  ament_cmake,
  ament_cmake_gmock,
  buildRosPackage,
  control_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  pluginlib,
  rclcpp_lifecycle,
  rcpputils,
  rcutils,
  ros2_control_test_assets,
  substituteSource,
  tinyxml2_vendor,
}:
let
  sources = rec {
    hardware_interface = substituteSource {
      src = fetchgit {
        name = "hardware_interface-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "e77735d4e51f435d8e3f0577dce3155bd3d4db8a";
        hash = "sha256-EgUbYlAc7GMNsNeq2pJhETo+HfhHBc6tqCsI7ltygas=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "hardware_interface";
  version = "3.25.0-1";
  src = sources.hardware_interface;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ control_msgs lifecycle_msgs pluginlib rclcpp_lifecycle rcpputils rcutils tinyxml2_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
