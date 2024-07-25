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
    kuka_lbr_iiwa_moveit_config = substituteSource {
      src = fetchgit {
        name = "kuka_lbr_iiwa_moveit_config-source";
        url = "https://github.com/ros2-gbp/kuka_robot_descriptions-release.git";
        rev = "e902259c4dac1d752d2c8ab4e55be5503dacfb26";
        hash = "sha256-vwD5Ks6JYzY2m9tCMETr2vQYgy188LyGbeS2Aax2oGc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kuka_lbr_iiwa_moveit_config";
  version = "0.9.0-2";
  src = sources.kuka_lbr_iiwa_moveit_config;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager kuka_resources moveit robot_state_publisher rviz2 urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
