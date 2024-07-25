{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    examples_rclcpp_multithreaded_executor = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_multithreaded_executor-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "5b268fb7153277e08b92177080364c2e5b1aa024";
        hash = "sha256-/HCYKdhhUv9wMyD+SD4Xf1l9HPnh9QI9HK/acQmnQQc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_multithreaded_executor";
  version = "0.15.1-1";
  src = sources.examples_rclcpp_multithreaded_executor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
