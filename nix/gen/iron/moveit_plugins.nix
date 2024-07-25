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
        rev = "d52432e0cb40b74f1a65e6c777524a47a5a230b4";
        hash = "sha256-60u7qJJH9DuAzRHZp8yKvEom9BvWE1VHKCF4bWEfWvA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_plugins";
  version = "2.8.0-1";
  src = sources.moveit_plugins;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_simple_controller_manager ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
