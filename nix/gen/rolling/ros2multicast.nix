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
        rev = "36273bc6f788016c7b5de6b6a32aff68e35482e2";
        hash = "sha256-WzpyMPKoMp9dD0ZdZH3E57bDzaHkd+LoPjJ9Iq+Vx1s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2multicast";
  version = "0.34.0-1";
  src = sources.ros2multicast;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros2cli ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
