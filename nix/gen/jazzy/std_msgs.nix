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
    std_msgs = substituteSource {
      src = fetchgit {
        name = "std_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "15bc7a0227f9937e286719154fdba18501cb7b11";
        hash = "sha256-qujzcYOInYZiNTUVuim1nJOC0QVdfbwKE8n0e2qBsco=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "std_msgs";
  version = "5.3.5-1";
  src = sources.std_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}