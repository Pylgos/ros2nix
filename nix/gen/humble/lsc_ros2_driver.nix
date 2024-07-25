{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    lsc_ros2_driver = substituteSource {
      src = fetchgit {
        name = "lsc_ros2_driver-source";
        url = "https://github.com/AutonicsLiDAR-release/lsc_ros2_driver-release.git";
        rev = "d557f8bb12228ee8b670a6cc5c8aae2d0a754440";
        hash = "sha256-1sX8s0HfWxKVbvPW3VF+8m1oIGeRL7Q+NKOke4yQptU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lsc_ros2_driver";
  version = "1.0.2-1";
  src = sources.lsc_ros2_driver;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_updater rclcpp sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
