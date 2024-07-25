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
    novatel_oem7_msgs = substituteSource {
      src = fetchgit {
        name = "novatel_oem7_msgs-source";
        url = "https://github.com/novatel-gbp/novatel_oem7_driver-release.git";
        rev = "4d84de75c764d1fcc18779c2b70cb0321bb50b57";
        hash = "sha256-nzm46nTpILsrxCXHF+7eG90730CnRqfBcSbc1hI8wJY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "novatel_oem7_msgs";
  version = "20.1.0-1";
  src = sources.novatel_oem7_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
