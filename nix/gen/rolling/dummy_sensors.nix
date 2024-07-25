{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    dummy_sensors = substituteSource {
      src = fetchgit {
        name = "dummy_sensors-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "76fe40d4ec1fb6c03e00d72b42f4c0c70e34980d";
        hash = "sha256-ZVNtIaX2oYFgV/zXR79qPtfB3dtqxtdr1XHEKu9wtiQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dummy_sensors";
  version = "0.34.1-1";
  src = sources.dummy_sensors;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
