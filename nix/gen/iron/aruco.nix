{
  ament_cmake,
  buildRosPackage,
  cv_bridge,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    aruco = substituteSource {
      src = fetchgit {
        name = "aruco-source";
        url = "https://github.com/pal-gbp/aruco_ros-release.git";
        rev = "f42be77ccd630b0a1498c51a7b183432fa68938b";
        hash = "sha256-3Foblmp2VasqOKhDmgA7heDxnleqT6Pqnk7dXajdiE4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "aruco";
  version = "5.0.5-1";
  src = sources.aruco;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge eigen ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
