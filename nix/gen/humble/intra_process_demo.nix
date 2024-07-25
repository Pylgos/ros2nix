{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_testing,
  launch_testing_ament_cmake,
  opencv,
  rclcpp,
  rmw_implementation_cmake,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    intra_process_demo = substituteSource {
      src = fetchgit {
        name = "intra_process_demo-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "480dd925827b79b86f43bf8cad1d8c68dc5ac74e";
        hash = "sha256-8Lc0eS9ArLLHRhJWgPTJ2GSXiXELFfPPjZwZhXnQC9w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "intra_process_demo";
  version = "0.20.4-1";
  src = sources.intra_process_demo;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ opencv rclcpp sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}