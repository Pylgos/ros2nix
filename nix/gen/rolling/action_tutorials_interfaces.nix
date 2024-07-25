{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    action_tutorials_interfaces = substituteSource {
      src = fetchgit {
        name = "action_tutorials_interfaces-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "0ce8145595ccf2d6d007d31451fab42734ad8d2f";
        hash = "sha256-k5Rcx1znel5+SSpdeQC+38NDd/cP9w7S0GgqYmBqZkU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "action_tutorials_interfaces";
  version = "0.34.1-1";
  src = sources.action_tutorials_interfaces;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
