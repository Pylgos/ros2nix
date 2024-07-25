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
        rev = "573e26bed53dd6bd71d660ee458b29decab254c8";
        hash = "sha256-uaMaraNjmPd01c7LkMzYOLRwApbrJQH8M9uYer8XkM8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_minimal_action_client";
  version = "0.18.0-2";
  src = sources.examples_rclcpp_minimal_action_client;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces rclcpp rclcpp_action ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
