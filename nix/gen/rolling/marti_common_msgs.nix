{
  ament_cmake,
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
    marti_common_msgs = substituteSource {
      src = fetchgit {
        name = "marti_common_msgs-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "3677b5451496d30345c283b9a6ae23c86d5f0c78";
        hash = "sha256-gaOU6sxuZ+abN7u8RPke/CL2TRRRxH+jAwDvOMS6Mbc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marti_common_msgs";
  version = "1.5.2-2";
  src = sources.marti_common_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
