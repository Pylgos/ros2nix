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
    nav_msgs = substituteSource {
      src = fetchgit {
        name = "nav_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "b9d95790457216030e8170763edf0a2af7c38304";
        hash = "sha256-poVZHmsY+dInphmSVLpHz/rCANLHT8+7HBLfUhp7Ces=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav_msgs";
  version = "4.2.4-1";
  src = sources.nav_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
