{
  action_msgs,
  ament_cmake,
  ament_lint_auto,
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
    weight_scale_interfaces = substituteSource {
      src = fetchgit {
        name = "weight_scale_interfaces-source";
        url = "https://github.com/TechMagicKK/weight_scale_interfaces-release.git";
        rev = "261f0e54629bfadb0f11907d4505ed87aee82832";
        hash = "sha256-UffYvB7Pv+rxqDHcSNdSdraluaYkYXWtfljQlu7HDCc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "weight_scale_interfaces";
  version = "0.0.3-1";
  src = sources.weight_scale_interfaces;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
