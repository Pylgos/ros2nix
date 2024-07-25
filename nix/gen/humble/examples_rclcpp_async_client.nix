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
        rev = "dabd6fa71986ad16ee591c23b3f1b763675b9004";
        hash = "sha256-AbIZOU/3lFFt2Au/mERkfGwdsO6QtrwYz/0UFBp6YB8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_async_client";
  version = "0.15.1-1";
  src = sources.examples_rclcpp_async_client;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
