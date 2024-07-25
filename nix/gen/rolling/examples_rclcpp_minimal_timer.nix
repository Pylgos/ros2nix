{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    examples_rclcpp_minimal_timer = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_timer-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "801e52232d7389f95fbecb3f53a47b3cf71492b8";
        hash = "sha256-gmaAr4R2Byf5Cu7o4KW+LD7m01Czm6gFZHQUoYbegH0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_minimal_timer";
  version = "0.20.1-1";
  src = sources.examples_rclcpp_minimal_timer;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
