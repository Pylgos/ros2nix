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
        rev = "f0a411982737960efeaddfe8cc5efe8ef1e65eb2";
        hash = "sha256-DXsFiagD68LtZbXnPc48NERJOLjNqqeE5e59JgoRtP8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "camera_info_manager";
  version = "3.1.9-1";
  src = sources.camera_info_manager;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_calibration_parsers rclcpp rcpputils sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
