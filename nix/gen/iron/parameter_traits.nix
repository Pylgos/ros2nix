{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fmt,
  rclcpp,
  rsl,
  substituteSource,
  tcb_span,
  tl_expected,
}:
let
  sources = rec {
    parameter_traits = substituteSource {
      src = fetchgit {
        name = "parameter_traits-source";
        url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
        rev = "0854962c198ba470f5292137e7be8da755e9ddbc";
        hash = "sha256-tbkbI2Z5iOPtVMur4gJQVJQ+af59uhEZt7UNahBZ01I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "parameter_traits";
  version = "0.3.8-3";
  src = sources.parameter_traits;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fmt rclcpp rsl tcb_span tl_expected ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
