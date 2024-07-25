{
  ament_cmake,
  ament_cmake_pytest,
  ament_cmake_python,
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  flexbe_core,
  flexbe_msgs,
  launch_ros,
  launch_testing,
  python3Packages,
  rclpy,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    flexbe_testing = substituteSource {
      src = fetchgit {
        name = "flexbe_testing-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "8f84823215fcc96611464ca5af384badd29807fc";
        hash = "sha256-K7mzZlpZlWZ5JQeGMQOPJ8PIAxeV2uNCHYx4ivIPQ4U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flexbe_testing";
  version = "3.0.2-1";
  src = sources.flexbe_testing;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ flexbe_core flexbe_msgs launch_ros rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
