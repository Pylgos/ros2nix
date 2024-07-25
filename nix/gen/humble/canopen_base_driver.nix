{
  ament_cmake_ros,
  ament_lint_auto,
  buildRosPackage,
  canopen_core,
  canopen_interfaces,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  lely_core_libraries,
  python3Packages,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  std_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    canopen_base_driver = substituteSource {
      src = fetchgit {
        name = "canopen_base_driver-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "a4b93045c32929f1458782cfb4f9a239ebf74028";
        hash = "sha256-9HGPfID/RBAVMLIl0miKrkqAqR+ewRF8yDsl+o/wHVY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "canopen_base_driver";
  version = "0.2.11-2";
  src = sources.canopen_base_driver;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ canopen_core canopen_interfaces diagnostic_updater lely_core_libraries python3Packages.boost rclcpp rclcpp_components rclcpp_lifecycle std_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
