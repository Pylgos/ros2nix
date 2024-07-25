{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher,
  moveit_resources_fanuc_description,
  moveit_resources_fanuc_moveit_config,
  moveit_resources_panda_description,
  moveit_resources_panda_moveit_config,
  moveit_resources_pr2_description,
  robot_state_publisher,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_resources = substituteSource {
      src = fetchgit {
        name = "moveit_resources-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "216ad03b6e42931ebca2b7ae5061ffe618ca07d7";
        hash = "sha256-2JXpcJUmN9knalpl57FLgPm7nTh4CNGaVdk7ulxv5Mc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_resources";
  version = "2.0.7-1";
  src = sources.moveit_resources;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher moveit_resources_fanuc_description moveit_resources_fanuc_moveit_config moveit_resources_panda_description moveit_resources_panda_moveit_config moveit_resources_pr2_description robot_state_publisher ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
