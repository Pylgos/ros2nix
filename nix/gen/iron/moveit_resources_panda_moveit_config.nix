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
        rev = "8c2355b52e3376a76a6d399f7a2416d4ac41d3dc";
        hash = "sha256-JIsBadWtNLBdD5if0F1gzzlwxlLdzx0IKSp+JPop7I0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_resources_panda_moveit_config";
  version = "2.1.1-1";
  src = sources.moveit_resources_panda_moveit_config;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher joint_state_publisher_gui moveit_resources_panda_description robot_state_publisher xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
