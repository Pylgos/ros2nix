{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_action,
  substituteSource,
}:
let
  sources = rec {
    examples_rclcpp_minimal_action_server = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_action_server-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "0702c6e2aef4f85ce544b46c07aaec9b81fa9463";
        hash = "sha256-v3N0WDmH7x8h8VDinmkCxL6Sgfk4XQ7UDhrBteBm1tw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_minimal_action_server";
  version = "0.20.1-1";
  src = sources.examples_rclcpp_minimal_action_server;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces rclcpp rclcpp_action ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
