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
    dbw_polaris_description = substituteSource {
      src = fetchgit {
        name = "dbw_polaris_description-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "d8d6c2ff0ed69cde5ab453dfec281c4edc81fe82";
        hash = "sha256-VfyxotLp8wkq483KUyCIr1r+4KiFAhB0nCTtOceZwFo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dbw_polaris_description";
  version = "2.1.16-1";
  src = sources.dbw_polaris_description;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ robot_state_publisher urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
