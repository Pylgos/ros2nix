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
    dbw_ford_description = substituteSource {
      src = fetchgit {
        name = "dbw_ford_description-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "7c50b03cfcdfff221cf361e84d9c846b09d3949b";
        hash = "sha256-mLEsMvljqyhqv8ppivONDHSnjmZk3l6opvl4keq8uPM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dbw_ford_description";
  version = "2.1.16-1";
  src = sources.dbw_ford_description;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ robot_state_publisher urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
