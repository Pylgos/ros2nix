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
        rev = "8f82dd5c724dc222ac795630fcf8e32cc3c203b4";
        hash = "sha256-hqqiauecY9R4fqhisGA7JfZIm7RnqlOnb6/NhY2FsLg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "unique_identifier_msgs";
  version = "2.5.0-3";
  src = sources.unique_identifier_msgs;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake rosidl_core_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_core_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
