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
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    visualization_msgs = substituteSource {
      src = fetchgit {
        name = "visualization_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "06fb7066af30950706fdca3ad6679605f83d78ed";
        hash = "sha256-gCuBM969oKvMolXzb9y2saGgaLmb37NzwQW0iYtoAWQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "visualization_msgs";
  version = "5.0.1-1";
  src = sources.visualization_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
