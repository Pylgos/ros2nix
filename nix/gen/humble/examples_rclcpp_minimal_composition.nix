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
    examples_rclcpp_minimal_composition = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_composition-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "81822d959b802946d76cb82268e8dcebf9afe15e";
        hash = "sha256-o1SCBTEeYRtlsT5aEyGFFkZ7ayk85DxSWTNjjRUJ0mI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_minimal_composition";
  version = "0.15.1-1";
  src = sources.examples_rclcpp_minimal_composition;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_components std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
