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
    examples_rclcpp_minimal_service = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_service-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "d361e005ea199710304190089671c426a665d542";
        hash = "sha256-uvRTU4H4NoSJjbt7CraFbAvQoEZGtYY8yre7cv8TeUA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_minimal_service";
  version = "0.18.0-2";
  src = sources.examples_rclcpp_minimal_service;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
