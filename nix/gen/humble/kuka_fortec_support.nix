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
    kuka_fortec_support = substituteSource {
      src = fetchgit {
        name = "kuka_fortec_support-source";
        url = "https://github.com/ros2-gbp/kuka_robot_descriptions-release.git";
        rev = "6f3e594858a81ea67ab956f6cad40416456d6671";
        hash = "sha256-KD3u4Hii0w+SoXb6KdFnx4jX1/X2zHDqHVYZk2Qz9cQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kuka_fortec_support";
  version = "0.9.0-2";
  src = sources.kuka_fortec_support;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher_gui kuka_resources launch_ros robot_state_publisher rviz2 urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
