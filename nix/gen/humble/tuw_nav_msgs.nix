{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    tuw_nav_msgs = substituteSource {
      src = fetchgit {
        name = "tuw_nav_msgs-source";
        url = "https://github.com/tuw-robotics/tuw_msgs-release.git";
        rev = "2b850b84e17acab6001b21426e39999d2be20dc2";
        hash = "sha256-Tdk2Ljgg75UGmxYVgDRxI8NKqjxCz9z/qjS3MkBICck=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tuw_nav_msgs";
  version = "0.2.1-1";
  src = sources.tuw_nav_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs nav_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
