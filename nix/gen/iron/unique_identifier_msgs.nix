{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_core_generators,
  rosidl_core_runtime,
  substituteSource,
}:
let
  sources = rec {
    unique_identifier_msgs = substituteSource {
      src = fetchgit {
        name = "unique_identifier_msgs-source";
        url = "https://github.com/ros2-gbp/unique_identifier_msgs-release.git";
        rev = "6d6008dd8ff02f0692140059583d7ac9974d13f5";
        hash = "sha256-v7OVEaITiMgz2pHuOvJRWREB8pQRJJLgbl02LTe4ixg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "unique_identifier_msgs";
  version = "2.3.2-3";
  src = sources.unique_identifier_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_core_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_core_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
