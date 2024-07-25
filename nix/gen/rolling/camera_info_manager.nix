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
        rev = "d7edeb5b7033bb53907380bb592f61881d8523cc";
        hash = "sha256-VS77jJn/DgbbthoaPYyzx7cQgMCYT1XPqy+VM6ZrE2E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "camera_info_manager";
  version = "5.3.0-1";
  src = sources.camera_info_manager;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp camera_calibration_parsers rclcpp rclcpp_lifecycle rcpputils sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
