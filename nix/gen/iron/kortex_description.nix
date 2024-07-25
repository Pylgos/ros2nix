{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher,
  joint_state_publisher_gui,
  joint_trajectory_controller,
  picknik_reset_fault_controller,
  picknik_twist_controller,
  robot_state_publisher,
  robotiq_description,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    kortex_description = substituteSource {
      src = fetchgit {
        name = "kortex_description-source";
        url = "https://github.com/ros2-gbp/ros2_kortex-release.git";
        rev = "f3c54fe0da1e654d6c08e186dc0ae1044bef4079";
        hash = "sha256-eH7UKiSAo+QFISA/cyGSkHrLrr4LNrQRNQJoNIQrK8M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kortex_description";
  version = "0.2.2-1";
  src = sources.kortex_description;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher joint_state_publisher_gui joint_trajectory_controller picknik_reset_fault_controller picknik_twist_controller robot_state_publisher robotiq_description rviz2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
