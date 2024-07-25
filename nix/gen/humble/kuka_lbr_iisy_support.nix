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
    kuka_lbr_iisy_support = substituteSource {
      src = fetchgit {
        name = "kuka_lbr_iisy_support-source";
        url = "https://github.com/ros2-gbp/kuka_robot_descriptions-release.git";
        rev = "bf7cbf841a949c2dcc065ce94dc7cfc4d445d790";
        hash = "sha256-LPuu+6Wek5B6/7ghaViRgvnS7ZKLxY9dOCJvPuX0L7M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kuka_lbr_iisy_support";
  version = "0.9.0-2";
  src = sources.kuka_lbr_iisy_support;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher_gui kuka_resources launch_ros robot_state_publisher rviz2 urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
