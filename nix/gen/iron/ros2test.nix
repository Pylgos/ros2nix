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
        rev = "ce8c8ad47a0f0dda1697b0aaffac0ae58d4bafee";
        hash = "sha256-dQrimozkVh9XkRJzzTrDPD9IJ421SC7vIXI2umkm3xc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2test";
  version = "0.5.2-3";
  src = sources.ros2test;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ domain_coordinator launch launch_testing ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_ros launch_testing_ros ros2cli ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
