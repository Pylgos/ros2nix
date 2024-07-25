{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  robot_state_publisher,
  rviz2,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    dbw_fca_description = substituteSource {
      src = fetchgit {
        name = "dbw_fca_description-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "3c101b7ab37ab777c0783ee2ee0ddbb5de563b28";
        hash = "sha256-dFTJvh64qFzvmfOGv0+bUoIIgHxtSm4viYXdkETUHA4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dbw_fca_description";
  version = "2.1.16-1";
  src = sources.dbw_fca_description;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ robot_state_publisher urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
