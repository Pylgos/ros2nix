{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rcpputils,
  sensor_msgs,
  substituteSource,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    camera_calibration_parsers = substituteSource {
      src = fetchgit {
        name = "camera_calibration_parsers-source";
        url = "https://github.com/ros2-gbp/image_common-release.git";
        rev = "c3c59b52fccc2dc2185c60cd967895515eae8da2";
        hash = "sha256-jkM6KMJbQCLJVUtWxrjAVbEaj12/B3xp/NlrtflxaZY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "camera_calibration_parsers";
  version = "4.2.4-1";
  src = sources.camera_calibration_parsers;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rcpputils sensor_msgs yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
