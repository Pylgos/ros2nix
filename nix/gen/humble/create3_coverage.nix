{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  create3_examples_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  irobot_create_msgs,
  nav_msgs,
  rclcpp,
  rclcpp_action,
  substituteSource,
  tf2_geometry_msgs,
}:
let
  sources = rec {
    create3_coverage = substituteSource {
      src = fetchgit {
        name = "create3_coverage-source";
        url = "https://github.com/ros2-gbp/create3_examples-release.git";
        rev = "da788f6503b42d5b0a4482e16f3237cacfc8d534";
        hash = "sha256-alQ50AUW8XhBP9FxNI2x4bVkE4/iMykvjkO5ENR9Mr8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "create3_coverage";
  version = "0.0.5-1";
  src = sources.create3_coverage;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ create3_examples_msgs geometry_msgs irobot_create_msgs nav_msgs rclcpp rclcpp_action tf2_geometry_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
