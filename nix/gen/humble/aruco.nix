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
        rev = "a0b03139f84da42e3f3d48403ae7aa45f6eeec19";
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
