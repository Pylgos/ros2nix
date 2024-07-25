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
    dbw_ford_msgs = substituteSource {
      src = fetchgit {
        name = "dbw_ford_msgs-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "7f456f9bf267525ad15dce2d8f653b7242c2feac";
        hash = "sha256-RZXyKwphgVKU/FvQceyVlzXcHm21JEpArMAaiSDp9PQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dbw_ford_msgs";
  version = "2.1.16-1";
  src = sources.dbw_ford_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
