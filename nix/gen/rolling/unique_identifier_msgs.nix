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
        rev = "7961de6e73e2d05d8bb1f9bec4baabb2116ece4c";
        hash = "sha256-RsXOsXOLhILnsdIJIseSj4+KuBj9hrISfm/4CH0Obms=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "unique_identifier_msgs";
  version = "2.7.0-1";
  src = sources.unique_identifier_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_core_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_core_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}