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
    marker_msgs = substituteSource {
      src = fetchgit {
        name = "marker_msgs-source";
        url = "https://github.com/tuw-robotics/marker_msgs-release.git";
        rev = "9f0de2f87ff9de7444ab8c95024a1bd480fca69d";
        hash = "sha256-TJ+mJSLub3gPCgw1hkWHwCQISpkllJxEB3y/zH9Syqs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marker_msgs";
  version = "0.0.8-3";
  src = sources.marker_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
