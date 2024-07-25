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
    kuka_lbr_iisy_moveit_config = substituteSource {
      src = fetchgit {
        name = "kuka_lbr_iisy_moveit_config-source";
        url = "https://github.com/ros2-gbp/kuka_robot_descriptions-release.git";
        rev = "63292ad66c434f9249ea3ab7f31d623cbcd3c2da";
        hash = "sha256-SIxFHPQw99q62kW1ZiK/f8SmrMSb1eIka5fL9hsubTg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kuka_lbr_iisy_moveit_config";
  version = "0.9.0-2";
  src = sources.kuka_lbr_iisy_moveit_config;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager kuka_resources moveit robot_state_publisher rviz2 urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
