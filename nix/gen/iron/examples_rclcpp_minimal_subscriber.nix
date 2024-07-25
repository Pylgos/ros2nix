{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    examples_rclcpp_minimal_subscriber = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_subscriber-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "59a865905a46ffb1a8248f3caf1596b4e8dd3720";
        hash = "sha256-YPFrYvlb6VR0YytVB4uXYh//ZbZ9Bfgyxy6spsCHTGE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_minimal_subscriber";
  version = "0.18.0-2";
  src = sources.examples_rclcpp_minimal_subscriber;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_components std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
