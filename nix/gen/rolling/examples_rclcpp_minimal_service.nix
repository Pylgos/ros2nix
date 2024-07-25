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
        rev = "369641667ca2ba1ef0ff79613ec044180d780640";
        hash = "sha256-Kfyrt+BOAQ0zlXVsUjpC2eLFNU5zo+BhXSLJo81KysQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_minimal_service";
  version = "0.20.1-1";
  src = sources.examples_rclcpp_minimal_service;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}