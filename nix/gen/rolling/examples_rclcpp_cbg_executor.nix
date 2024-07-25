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
    examples_rclcpp_cbg_executor = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_cbg_executor-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "2b4488f6b2962dd47c7c8a6a0fa0e13b44602906";
        hash = "sha256-7Weqr8iRmEDVP8xFHSisZcISvAgV+ezTFbk8Crj8xo4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_cbg_executor";
  version = "0.20.1-1";
  src = sources.examples_rclcpp_cbg_executor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
