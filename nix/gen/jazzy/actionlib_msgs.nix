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
        rev = "e5ca8552eb6cf8f1a9006a91eba15929fb78e5c9";
        hash = "sha256-W5qtKfERMOml/Kju3tQbLWR1kBr0jb2InsRMwMFDQwE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "actionlib_msgs";
  version = "5.3.5-1";
  src = sources.actionlib_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}