{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher_gui,
  kuka_resources,
  launch_ros,
  launch_testing_ament_cmake,
  robot_state_publisher,
  rviz2,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    kuka_lbr_iiwa_support = substituteSource {
      src = fetchgit {
        name = "kuka_lbr_iiwa_support-source";
        url = "https://github.com/ros2-gbp/kuka_robot_descriptions-release.git";
        rev = "39665534d20f4117a0427b97521271a1957dc149";
        hash = "sha256-0v/jyYtgGDFylI9T+lUv269oeU0klZP283/oAoYomzQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kuka_lbr_iiwa_support";
  version = "0.9.0-2";
  src = sources.kuka_lbr_iiwa_support;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher_gui kuka_resources launch_ros robot_state_publisher rviz2 urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
