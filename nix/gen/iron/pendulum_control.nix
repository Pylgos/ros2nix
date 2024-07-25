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
  launch_testing_ros,
  pendulum_msgs,
  rclcpp,
  rmw_implementation_cmake,
  ros2run,
  rttest,
  substituteSource,
  tlsf_cpp,
}:
let
  sources = rec {
    pendulum_control = substituteSource {
      src = fetchgit {
        name = "pendulum_control-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "5d417446a1f8abe4f2d0e63999c6a3c2c87e8fc6";
        hash = "sha256-KYb4Hc/MSsievlnUak0bD9pQtq+A1d9OiyxJeZnd/QU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pendulum_control";
  version = "0.27.1-1";
  src = sources.pendulum_control;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pendulum_msgs rclcpp rttest tlsf_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
