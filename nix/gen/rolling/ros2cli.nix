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
        rev = "09e655a8334bd9fb6257c3367a2ff28095ca923d";
        hash = "sha256-o8yPnVNv+8pVIllpErozon2vK/Yeh9JVYIdl1jLECwM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2cli";
  version = "0.34.0-1";
  src = sources.ros2cli;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.argcomplete buildPackages.python3Packages.importlib-metadata ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.packaging python3Packages.psutil python3Packages.setuptools rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
