{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware_interface,
  picknik_ament_copyright,
  rclcpp,
  ros2_control_test_assets,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    topic_based_ros2_control = substituteSource {
      src = fetchgit {
        name = "topic_based_ros2_control-source";
        url = "https://github.com/ros2-gbp/topic_based_ros2_control-release.git";
        rev = "deead100cfdff1130c17f55e8c4d1cc70431d7b5";
        hash = "sha256-SEfc/iqNZsxrD/m/f0CKmIfgo4mFGeziwqBv/ZXj1lM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "topic_based_ros2_control";
  version = "0.2.0-1";
  src = sources.topic_based_ros2_control;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles hardware_interface rclcpp sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}