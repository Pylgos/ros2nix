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
    examples_rclcpp_async_client = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_async_client-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "2d0493121694102507749414eda79fa37f801bae";
        hash = "sha256-mljBSSQBCZFYhJSuuTOpLQBWCLJvKVLnuEDZXABz0UQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_async_client";
  version = "0.20.1-1";
  src = sources.examples_rclcpp_async_client;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
