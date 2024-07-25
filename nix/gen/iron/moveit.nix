{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_core,
  moveit_planners,
  moveit_plugins,
  moveit_ros,
  moveit_setup_assistant,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit = substituteSource {
      src = fetchgit {
        name = "moveit-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "8e8aeb0551d7482384c9b5af7475beb2beffcea4";
        hash = "sha256-IqfeDxd8VBsPasUurZEQvDxO2zlbnDWzTaZXZE2ufPg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit";
  version = "2.8.0-1";
  src = sources.moveit;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_core moveit_planners moveit_plugins moveit_ros moveit_setup_assistant ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
