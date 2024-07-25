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
    dbw_fca_msgs = substituteSource {
      src = fetchgit {
        name = "dbw_fca_msgs-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "7ce8f1dc417de518bf5ea70cdb1f8a5f324c7661";
        hash = "sha256-q9NCnYj7Y5bYxFvGqpXfgMwql5KVBWqgRK/I8PJSz/0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dbw_fca_msgs";
  version = "2.1.16-1";
  src = sources.dbw_fca_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
