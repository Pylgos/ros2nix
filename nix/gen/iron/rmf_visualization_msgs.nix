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
  substituteSource,
}:
let
  sources = rec {
    rmf_visualization_msgs = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_visualization_msgs-release.git";
        rev = "95468e30b88706caf08373c57d28b07eb07bfaeb";
        hash = "sha256-zLmUO2MT38qWo5DkVTfT5iRARePAGMfJRgg9pqW673M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_visualization_msgs";
  version = "1.3.1-1";
  src = sources.rmf_visualization_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
