{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    shape_msgs = substituteSource {
      src = fetchgit {
        name = "shape_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "97a0902a8f3aec4d1d42c0ac3364cb39cc9c7728";
        hash = "sha256-EE0q3gvgd6MIDS257lAIeLPUOKkFaHLGlKdy+onTxZM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "shape_msgs";
  version = "4.2.4-1";
  src = sources.shape_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
