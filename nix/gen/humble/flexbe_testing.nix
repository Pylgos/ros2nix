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
        rev = "e6c001d60ece282397749530b30b555ad6dd9051";
        hash = "sha256-Cr72akQW7hQzkMhCYBT2h4HamdvdfKo2i3ZKL1P/7S0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flexbe_testing";
  version = "2.3.5-1";
  src = sources.flexbe_testing;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ flexbe_core flexbe_msgs launch_ros rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
