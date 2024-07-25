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
        rev = "5a7b9f572ccf4e279c26423144681beef60958db";
        hash = "sha256-AOmEnD1NDa3ubALAn/+LVF1mdyfF0dTxuvfy3CTk0d4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2pkg";
  version = "0.25.6-1";
  src = sources.ros2pkg;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_copyright ament_index_python buildPackages.python3Packages.catkin-pkg buildPackages.python3Packages.empy buildPackages.python3Packages.importlib-resources ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.setuptools ros2cli ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
