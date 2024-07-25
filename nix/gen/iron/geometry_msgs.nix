{
  ament_cmake,
  ament_lint_common,
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
    geometry_msgs = substituteSource {
      src = fetchgit {
        name = "geometry_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "fb793b7a6876745257ed17cd6fc7c57f2a01ae0c";
        hash = "sha256-RDVkk4ZSs1FLUfTBIRkUp0fu8dAhnMU8IR7KIRBsbO4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "geometry_msgs";
  version = "5.0.1-1";
  src = sources.geometry_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
