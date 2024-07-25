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
        rev = "f94c49dba18024e4151b7624b91274550a865f6e";
        hash = "sha256-43+VciZV6RElh7fB0SoDXcYK4RklS89qFNcIcXdpe4o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_minimal_subscriber";
  version = "0.15.1-1";
  src = sources.examples_rclcpp_minimal_subscriber;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_components std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
