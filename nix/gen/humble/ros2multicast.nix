{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  ros2cli,
  substituteSource,
}:
let
  sources = rec {
    ros2multicast = substituteSource {
      src = fetchgit {
        name = "ros2multicast-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "e6c2cee4b82d97cb0d09af5577b34e6c9f08d71f";
        hash = "sha256-UetVjyiCUi/MddBxkOt8gtu+5ZCyGTwpgvy5I96QZYo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2multicast";
  version = "0.18.10-1";
  src = sources.ros2multicast;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros2cli ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
