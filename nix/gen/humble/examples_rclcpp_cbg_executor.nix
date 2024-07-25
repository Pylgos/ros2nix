{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    examples_rclcpp_cbg_executor = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_cbg_executor-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "2e99dc73c941ab556666554d2dd7e1ef6a4d2e98";
        hash = "sha256-uZCLXZuMFPvw8m06DCw6rKQ2BRRjssncqnqW/3T+n0I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_cbg_executor";
  version = "0.15.1-1";
  src = sources.examples_rclcpp_cbg_executor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
