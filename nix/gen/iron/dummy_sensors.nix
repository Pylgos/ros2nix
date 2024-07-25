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
        rev = "8a8340f96e10a168eec0707b429744f7236684b5";
        hash = "sha256-VFhmwowH5FGdC8lG+G5iruF3yf2g2v5bEs+ycdk0iRE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dummy_sensors";
  version = "0.27.1-1";
  src = sources.dummy_sensors;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
