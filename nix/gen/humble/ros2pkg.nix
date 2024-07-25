{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  ament_xmllint,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_testing,
  launch_testing_ros,
  python3Packages,
  ros2cli,
  substituteSource,
}:
let
  sources = rec {
    ros2pkg = substituteSource {
      src = fetchgit {
        name = "ros2pkg-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "cce52c75c795cb5d4fa64ee92953d0fef0817325";
        hash = "sha256-o1I4juPQawUAtjw+J+Ro4CqULlqSTu2pvxcADHkSmGw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2pkg";
  version = "0.18.10-1";
  src = sources.ros2pkg;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_copyright ament_index_python buildPackages.python3Packages.catkin-pkg buildPackages.python3Packages.empy buildPackages.python3Packages.importlib-resources ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.setuptools ros2cli ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}