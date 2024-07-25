{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_index_cpp,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  camera_calibration_parsers,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_lifecycle,
  rcpputils,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    camera_info_manager = substituteSource {
      src = fetchgit {
        name = "camera_info_manager-source";
        url = "https://github.com/ros2-gbp/image_common-release.git";
        rev = "07d07c369a3a6fef7355a1dad1d96ee1e38b0d32";
        hash = "sha256-QFmpWINTXepuN+s/BtgZk/NsVJBKOO6+p6QuHYMCH/w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "camera_info_manager";
  version = "4.2.4-1";
  src = sources.camera_info_manager;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_calibration_parsers rclcpp rclcpp_lifecycle rcpputils sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
