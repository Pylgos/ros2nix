{
  ament_cmake,
  ament_cmake_gmock,
  buildRosPackage,
  canopen_402_driver,
  canopen_core,
  canopen_proxy_driver,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware_interface,
  pluginlib,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  ros2_control_test_assets,
  substituteSource,
}:
let
  sources = rec {
    canopen_ros2_control = substituteSource {
      src = fetchgit {
        name = "canopen_ros2_control-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "54b69b6db47799811c5f5c90a975afa8eb0d3173";
        hash = "sha256-M1y6Q2OmHtLfOtKlLrojyo8QqR0cMcaoDZkRsXNrbpc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "canopen_ros2_control";
  version = "0.2.11-2";
  src = sources.canopen_ros2_control;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ canopen_402_driver canopen_core canopen_proxy_driver hardware_interface pluginlib rclcpp rclcpp_components rclcpp_lifecycle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
