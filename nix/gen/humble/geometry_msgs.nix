{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    geometry_msgs = substituteSource {
      src = fetchgit {
        name = "geometry_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "5d5e76a497cf8afff478122e6fc0829bf001ccac";
        hash = "sha256-IrAszLcnsa6Ws7xSpE2I+xJ1vlkHOhmHynKPYuhVw4g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "geometry_msgs";
  version = "4.2.4-1";
  src = sources.geometry_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
