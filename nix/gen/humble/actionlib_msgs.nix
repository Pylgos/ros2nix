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
    actionlib_msgs = substituteSource {
      src = fetchgit {
        name = "actionlib_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "c4557e38a953625a0b4289adcc5d4ceae5d02c23";
        hash = "sha256-OS4jsQzkEPe6xe1HbGrrTLnxLcQHp9nXVoSwyU/KFwQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "actionlib_msgs";
  version = "4.2.4-1";
  src = sources.actionlib_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
