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
    examples_rclcpp_minimal_action_client = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_action_client-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "5f7b60f71beafa8e7a2f8ebda867cff8da1f79be";
        hash = "sha256-1K33DUlzQkmdixBz2I58WPp0kMiw5qXDW1rhJuro6yI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_minimal_action_client";
  version = "0.15.1-1";
  src = sources.examples_rclcpp_minimal_action_client;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces rclcpp rclcpp_action ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
