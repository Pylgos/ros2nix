{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  launch_xml,
  launch_yaml,
  python3Packages,
  ros2cli,
  ros2pkg,
  substituteSource,
}:
let
  sources = rec {
    ros2launch = substituteSource {
      src = fetchgit {
        name = "ros2launch-source";
        url = "https://github.com/ros2-gbp/launch_ros-release.git";
        rev = "c4b9f444708c6dcf993f1083f569584be2080340";
        hash = "sha256-zDHvNFfYc4c7u5mkkS3kstuZBu5HEXl8NblGanAAwOU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2launch";
  version = "0.27.1-1";
  src = sources.ros2launch;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_ros launch_xml launch_yaml ros2cli ros2pkg ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
