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
        rev = "a26d117bc9e116cf52c175b42202e973a2e1b144";
        hash = "sha256-63g9mDQGZZ8UeFM6LEs2bk3F8rkfsPv1D2A+AHKct1s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2launch";
  version = "0.19.7-2";
  src = sources.ros2launch;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python launch launch_xml launch_yaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_ros ros2cli ros2pkg ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
