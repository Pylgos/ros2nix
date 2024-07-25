{
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  canopen_core,
  canopen_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lely_core_libraries,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  substituteSource,
}:
let
  sources = rec {
    canopen_master_driver = substituteSource {
      src = fetchgit {
        name = "canopen_master_driver-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "137dde1c9fc998f3eaa5f3d6640f16c8e3aaddde";
        hash = "sha256-S+pCfbi9tCe8LS2FARf9CroiCf3NM1IbyYP2kAWM5nY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "canopen_master_driver";
  version = "0.2.11-2";
  src = sources.canopen_master_driver;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ canopen_core canopen_interfaces lely_core_libraries rclcpp rclcpp_components rclcpp_lifecycle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
