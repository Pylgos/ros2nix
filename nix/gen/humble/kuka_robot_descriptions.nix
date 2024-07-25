{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  kuka_agilus_support,
  kuka_cybertech_support,
  kuka_fortec_support,
  kuka_iontec_support,
  kuka_kr_moveit_config,
  kuka_lbr_iisy_moveit_config,
  kuka_lbr_iisy_support,
  kuka_lbr_iiwa_moveit_config,
  kuka_lbr_iiwa_support,
  kuka_mock_hardware_interface,
  kuka_quantec_support,
  kuka_resources,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    kuka_robot_descriptions = substituteSource {
      src = fetchgit {
        name = "kuka_robot_descriptions-source";
        url = "https://github.com/ros2-gbp/kuka_robot_descriptions-release.git";
        rev = "4af412e8499c324a4bac83e7cd17c530d626361a";
        hash = "sha256-I999zcgI5xkk9oXN15C78Kt8IVJiemKelNM16SA7xdM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kuka_robot_descriptions";
  version = "0.9.0-2";
  src = sources.kuka_robot_descriptions;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ kuka_agilus_support kuka_cybertech_support kuka_fortec_support kuka_iontec_support kuka_kr_moveit_config kuka_lbr_iisy_moveit_config kuka_lbr_iisy_support kuka_lbr_iiwa_moveit_config kuka_lbr_iiwa_support kuka_mock_hardware_interface kuka_quantec_support kuka_resources ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
