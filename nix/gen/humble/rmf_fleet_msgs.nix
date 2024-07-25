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
    rmf_fleet_msgs = substituteSource {
      src = fetchgit {
        name = "rmf_fleet_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "45f42cbfdecc60eb2035bff95e25ec07a90527a1";
        hash = "sha256-3qnQT/iVcg1+KyCZBxRoAsEP6TBdRDusIWoIxkKDUoY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_fleet_msgs";
  version = "3.0.4-1";
  src = sources.rmf_fleet_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
