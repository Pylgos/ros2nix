{
  ament_cmake,
  ament_lint_auto,
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
  visualization_msgs,
}:
let
  sources = rec {
    situational_graphs_msgs = substituteSource {
      src = fetchgit {
        name = "situational_graphs_msgs-source";
        url = "https://github.com/ros2-gbp/situational_graphs_msgs-release.git";
        rev = "d429f63e2cb5374218f7b7082cd74a671e7418c0";
        hash = "sha256-Mhc2Zl/ZUVUM/Ot6wPmukpeW8PZeldbasBwSMe5eqws=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "situational_graphs_msgs";
  version = "0.0.1-2";
  src = sources.situational_graphs_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime sensor_msgs std_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
