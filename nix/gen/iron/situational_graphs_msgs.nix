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
        rev = "ed444f515a129e8b1d16a2235ab85f3bdd2ae62c";
        hash = "sha256-Mhc2Zl/ZUVUM/Ot6wPmukpeW8PZeldbasBwSMe5eqws=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "situational_graphs_msgs";
  version = "0.0.1-1";
  src = sources.situational_graphs_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime sensor_msgs std_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
