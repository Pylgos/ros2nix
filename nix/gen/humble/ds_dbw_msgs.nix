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
    ds_dbw_msgs = substituteSource {
      src = fetchgit {
        name = "ds_dbw_msgs-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "c82a8e313c938b7bc68d62f89441ef89edecbc3c";
        hash = "sha256-K+X3hEix2buTD8lkJBD/F9T3u2al9DigiYTjQiKvkOY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ds_dbw_msgs";
  version = "2.1.16-1";
  src = sources.ds_dbw_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
