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
        rev = "753781b799cd0100ef4df6921f40c48c55b9cf1f";
        hash = "sha256-P8sIFiq4bhQIOO7FtBE5LzZmrm777YSgVSesEcIqtRs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_configs_utils";
  version = "2.8.0-1";
  src = sources.moveit_configs_utils;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_param_builder launch_ros srdfdom ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
