{
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_param_builder,
  launch_ros,
  srdfdom,
  substituteSource,
}:
let
  sources = rec {
    moveit_configs_utils = substituteSource {
      src = fetchgit {
        name = "moveit_configs_utils-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "a727b5d5834bddab83e4b434c30106a6972bcd8d";
        hash = "sha256-LQcsGnmeT6ulbZsSJofh8eip34voccbjaMbjZG7jUgw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_configs_utils";
  version = "2.5.5-1";
  src = sources.moveit_configs_utils;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_param_builder launch_ros srdfdom ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
