{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    ros2cli = substituteSource {
      src = fetchgit {
        name = "ros2cli-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "97a3f66bd62b3dc7a76695815a6b468e9aebeade";
        hash = "sha256-n0vXeLJB9YEqplGxgTvorOq7t+nFa9sZjvjYAf+P7s8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2cli";
  version = "0.18.10-1";
  src = sources.ros2cli;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.argcomplete buildPackages.python3Packages.importlib-metadata ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.netifaces python3Packages.packaging python3Packages.setuptools rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
