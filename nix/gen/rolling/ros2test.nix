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
        rev = "0fb381524031ec4f726a9e8b66c7131d7cb255d4";
        hash = "sha256-olwk64D3GE1aVi7nCpoeYy3g1ATAPTNcQboODme41b8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2test";
  version = "0.7.0-1";
  src = sources.ros2test;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ domain_coordinator launch launch_testing ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_ros launch_testing_ros ros2cli ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}