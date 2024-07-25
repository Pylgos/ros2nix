{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_simple_controller_manager,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_plugins = substituteSource {
      src = fetchgit {
        name = "moveit_plugins-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "1136b2e7d65fc223548de05401d683ad9bee623c";
        hash = "sha256-j7qLKUzswDt3FMwN7jcOeRu7ao7H01YFy/JcNfaKj5U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_plugins";
  version = "2.5.5-1";
  src = sources.moveit_plugins;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_simple_controller_manager ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
