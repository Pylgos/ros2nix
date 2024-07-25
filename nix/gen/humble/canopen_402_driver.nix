{
  ament_cmake_ros,
  ament_lint_auto,
  buildRosPackage,
  canopen_base_driver,
  canopen_core,
  canopen_interfaces,
  canopen_proxy_driver,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  sensor_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    canopen_402_driver = substituteSource {
      src = fetchgit {
        name = "canopen_402_driver-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "c34ccc16da46a7f48bd264ec62da8888113024dd";
        hash = "sha256-LDj7kszI1dHYnCfUOgwbj84kL5hTSY40sriEInp+DAI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "canopen_402_driver";
  version = "0.2.11-2";
  src = sources.canopen_402_driver;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ canopen_base_driver canopen_core canopen_interfaces canopen_proxy_driver python3Packages.boost rclcpp rclcpp_components rclcpp_lifecycle sensor_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
