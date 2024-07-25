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
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    moveit_resources_panda_moveit_config = substituteSource {
      src = fetchgit {
        name = "moveit_resources_panda_moveit_config-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "3bc141c0d39d612641171314588ed34dc48c8871";
        hash = "sha256-IzD8h9vG/ubI+KiIi29jdSYHAPemP2mDltKRwe/8iNU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_resources_panda_moveit_config";
  version = "2.0.7-1";
  src = sources.moveit_resources_panda_moveit_config;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher joint_state_publisher_gui moveit_resources_panda_description robot_state_publisher xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
