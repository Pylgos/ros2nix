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
    statistics_msgs = substituteSource {
      src = fetchgit {
        name = "statistics_msgs-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "daa199846667319a125fd939c8d5ca2012e17172";
        hash = "sha256-HqiOiNgeVy958hBVOP3Gni16sz5aAbEDRilN8pxHOGA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "statistics_msgs";
  version = "1.2.1-1";
  src = sources.statistics_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
