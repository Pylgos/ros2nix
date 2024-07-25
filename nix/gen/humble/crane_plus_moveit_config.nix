{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit,
  robot_state_publisher,
  rviz2,
  substituteSource,
  tf2_ros,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    crane_plus_moveit_config = substituteSource {
      src = fetchgit {
        name = "crane_plus_moveit_config-source";
        url = "https://github.com/ros2-gbp/crane_plus-release.git";
        rev = "9252ce90510986c645947ee946c701fb436edc2e";
        hash = "sha256-kvvtIRpfHfvua3AGiXMeqbREyJAoA5ia88mxBAfFCuY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "crane_plus_moveit_config";
  version = "2.0.1-1";
  src = sources.crane_plus_moveit_config;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit robot_state_publisher rviz2 tf2_ros xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
