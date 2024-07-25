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
        rev = "c5871bc5f35d1d3cc4919ddcf693b03e7758582f";
        hash = "sha256-d3LO3Y350cR9qZtgkL6R3oNbGtgnLhV05WM3yFkazxA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2cli";
  version = "0.25.6-1";
  src = sources.ros2cli;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.argcomplete buildPackages.python3Packages.importlib-metadata ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.netifaces python3Packages.packaging python3Packages.setuptools rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
