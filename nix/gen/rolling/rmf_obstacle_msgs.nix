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
    rmf_obstacle_msgs = substituteSource {
      src = fetchgit {
        name = "rmf_obstacle_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "bd0f5d903fea0de6efac65d2c33e718d65e4c686";
        hash = "sha256-T+44xFhP0J1CcKlHCMsscjVNq744oOxfx4YahZcS90k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_obstacle_msgs";
  version = "3.4.0-1";
  src = sources.rmf_obstacle_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}