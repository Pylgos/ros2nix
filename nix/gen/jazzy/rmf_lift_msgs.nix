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
    rmf_lift_msgs = substituteSource {
      src = fetchgit {
        name = "rmf_lift_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "7bde0e3a44aa28f48a200305762f4dbb81636c08";
        hash = "sha256-nOEHLKOFOfoESrFoDSQcXcBWu20rgvI33o0DoeC9IE4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_lift_msgs";
  version = "3.3.1-1";
  src = sources.rmf_lift_msgs;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
