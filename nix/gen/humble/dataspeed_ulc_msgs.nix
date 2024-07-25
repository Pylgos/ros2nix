{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    dataspeed_ulc_msgs = substituteSource {
      src = fetchgit {
        name = "dataspeed_ulc_msgs-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "051a4f66ba9eb3ebd6d24199a4a1f9e9455357af";
        hash = "sha256-Djrh3JKKj1JGhhfmPrVHKiIMMmDJZkHsEcO79fS8t7w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dataspeed_ulc_msgs";
  version = "2.1.16-1";
  src = sources.dataspeed_ulc_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
