{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher,
  joint_state_publisher_gui,
  moveit_resources_panda_description,
  robot_state_publisher,
  substituteSource,
  topic_tools,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    dual_arm_panda_moveit_config = substituteSource {
      src = fetchgit {
        name = "dual_arm_panda_moveit_config-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "f0281b8ac4677bb004917d5e96f7033fb5fcdf3a";
        hash = "sha256-jQcr89ELOmG4jFlkdIjLxpEjYFnr77hE9nLs96BRgIw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dual_arm_panda_moveit_config";
  version = "2.1.1-1";
  src = sources.dual_arm_panda_moveit_config;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher joint_state_publisher_gui moveit_resources_panda_description robot_state_publisher topic_tools xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
