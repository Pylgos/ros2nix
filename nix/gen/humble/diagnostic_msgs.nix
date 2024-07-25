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
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    diagnostic_msgs = substituteSource {
      src = fetchgit {
        name = "diagnostic_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "77073742b2e04cc808f3f4dd6edf9dae30017dcc";
        hash = "sha256-73WribUFIdDpRgddhcRyhPDKH/hMoPjDU2P8FGLbv1Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "diagnostic_msgs";
  version = "4.2.4-1";
  src = sources.diagnostic_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
