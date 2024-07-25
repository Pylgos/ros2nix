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
  substituteSource,
}:
let
  sources = rec {
    examples_rclcpp_minimal_client = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_client-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "4f4bc84e75af400c93f935af2c40dc42d6883132";
        hash = "sha256-+qRk8w2zD3so1trUMmHlEA9l11TyKVUwRDyFVSrsNoQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_minimal_client";
  version = "0.15.1-1";
  src = sources.examples_rclcpp_minimal_client;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
