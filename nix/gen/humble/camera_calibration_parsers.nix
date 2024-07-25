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
        rev = "4d3bfae94d46f7cd60738c6ecfeba296ef5d12c5";
        hash = "sha256-zf8Ttk3g9+njd/3a7IMyjHnfuZgNo54oE+uy2/yGVkc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "camera_calibration_parsers";
  version = "3.1.9-1";
  src = sources.camera_calibration_parsers;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rcpputils sensor_msgs yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
