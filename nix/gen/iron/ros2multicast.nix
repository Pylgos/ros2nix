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
        rev = "d9c1264bda1353e2d8cf6df308fd522d785e0682";
        hash = "sha256-wPmPrZ249Zt6iA/EeKhjTgshScPX6uROFmdtbmITdgs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2multicast";
  version = "0.25.6-1";
  src = sources.ros2multicast;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros2cli ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
