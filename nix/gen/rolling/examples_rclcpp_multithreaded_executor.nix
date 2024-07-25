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
        rev = "421a579cdbf181cfae15e181345b903997dc7dca";
        hash = "sha256-Ckd9cQwKgfkV9CAhT363+RGe4xCId26GlTnCG1c3E2U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_multithreaded_executor";
  version = "0.20.1-1";
  src = sources.examples_rclcpp_multithreaded_executor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
