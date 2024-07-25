{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  as2_behavior,
  as2_core,
  as2_msgs,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    as2_behaviors_perception = substituteSource {
      src = fetchgit {
        name = "as2_behaviors_perception-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "9eaf25ad5fe901d4f7da6e9512d9063da4ceb87d";
        hash = "sha256-3FL3mRn+xBxaiUvIzSY6cQ6jzFLaicYGfvLOIqjFwL8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "as2_behaviors_perception";
  version = "1.0.9-1";
  src = sources.as2_behaviors_perception;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ as2_behavior as2_core as2_msgs cv_bridge rclcpp sensor_msgs std_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
