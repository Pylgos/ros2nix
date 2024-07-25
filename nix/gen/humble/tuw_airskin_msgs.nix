{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
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
    tuw_airskin_msgs = substituteSource {
      src = fetchgit {
        name = "tuw_airskin_msgs-source";
        url = "https://github.com/tuw-robotics/tuw_msgs-release.git";
        rev = "65bcb66d8bedd23137744e2796ed47f592fd0932";
        hash = "sha256-Ane4Zzd3GA8FCYnyftPDjqfIrxhFTxYhLcVgrTACQhE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tuw_airskin_msgs";
  version = "0.2.1-1";
  src = sources.tuw_airskin_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
