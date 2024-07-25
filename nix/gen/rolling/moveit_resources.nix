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
        rev = "da075743e72824c2f818f4b800b68f22d0305e79";
        hash = "sha256-nQVTLNFKshftxcEkkLVLw+Azj/KgNptezxk3p/3foWw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_resources";
  version = "3.0.0-2";
  src = sources.moveit_resources;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher moveit_resources_fanuc_description moveit_resources_fanuc_moveit_config moveit_resources_panda_description moveit_resources_panda_moveit_config moveit_resources_pr2_description robot_state_publisher ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}