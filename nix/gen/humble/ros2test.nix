{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  domain_coordinator,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  launch_testing,
  launch_testing_ros,
  python3Packages,
  ros2cli,
  substituteSource,
}:
let
  sources = rec {
    ros2test = substituteSource {
      src = fetchgit {
        name = "ros2test-source";
        url = "https://github.com/ros2-gbp/ros_testing-release.git";
        rev = "0a986fbd27857ff5d1f2a7937e1ac127e61fe59b";
        hash = "sha256-0ct2zxFuOGf8MCy8K08EszVJLrK4DTFg2kn5JpqzLr0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2test";
  version = "0.4.0-3";
  src = sources.ros2test;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ domain_coordinator launch launch_testing ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_ros launch_testing_ros ros2cli ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
