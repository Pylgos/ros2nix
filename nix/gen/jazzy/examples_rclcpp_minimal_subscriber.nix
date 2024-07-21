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
        rev = "51085a7cdc7e60d40c5f523e193748e79d1b9dba";
        hash = "sha256-tu9OkbPYxmWgDYDJhYrmvkDUtuBr4uK5El2ZvTgnb8k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_minimal_subscriber";
  version = "0.19.4-1";
  src = sources.examples_rclcpp_minimal_subscriber;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_components std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}