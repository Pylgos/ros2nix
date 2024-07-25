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
        rev = "8fdde12ce7dfb6c9bfad01c50d5cef1049dd50b8";
        hash = "sha256-Wc2FtvMRwHIzhxPYR6dueCSQWxMqZwQL5bJKOHpeAOA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_resources";
  version = "2.1.1-1";
  src = sources.moveit_resources;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher moveit_resources_fanuc_description moveit_resources_fanuc_moveit_config moveit_resources_panda_description moveit_resources_panda_moveit_config moveit_resources_pr2_description robot_state_publisher ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
