{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    dbw_polaris_msgs = substituteSource {
      src = fetchgit {
        name = "dbw_polaris_msgs-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "1fb08f022f0bec0d13c15339b5da42af73b0d0cf";
        hash = "sha256-lTODoLy+1juSkR9jj8oJRIka2v+zLO/jEQ+Y4Jz5klY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dbw_polaris_msgs";
  version = "2.1.16-1";
  src = sources.dbw_polaris_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
