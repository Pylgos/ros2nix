{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
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
    rmf_dispenser_msgs = substituteSource {
      src = fetchgit {
        name = "rmf_dispenser_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "d1575552d5bdca91359a09c134aa579b565210df";
        hash = "sha256-Zz/VWEk5bNDiXzYSMim3VcdMozFNjuYNyz7gwAMa89k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_dispenser_msgs";
  version = "3.4.0-1";
  src = sources.rmf_dispenser_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}