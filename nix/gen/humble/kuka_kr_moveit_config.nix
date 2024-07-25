{
  ament_cmake,
  buildRosPackage,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  kuka_resources,
  moveit,
  robot_state_publisher,
  rviz2,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    kuka_kr_moveit_config = substituteSource {
      src = fetchgit {
        name = "kuka_kr_moveit_config-source";
        url = "https://github.com/ros2-gbp/kuka_robot_descriptions-release.git";
        rev = "35bfda89982f95243cf7c9827f1dc6771844ff8e";
        hash = "sha256-HbrCExeR6U53TGEogEpYJ6J1LMPA8OXehjFRwx63d4M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kuka_kr_moveit_config";
  version = "0.9.0-2";
  src = sources.kuka_kr_moveit_config;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager kuka_resources moveit robot_state_publisher rviz2 urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
