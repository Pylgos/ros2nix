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
    kuka_agilus_support = substituteSource {
      src = fetchgit {
        name = "kuka_agilus_support-source";
        url = "https://github.com/ros2-gbp/kuka_robot_descriptions-release.git";
        rev = "07c39122e15199bd14fa8dd32759e957a7ad3376";
        hash = "sha256-DTwMXQ2mBhsQWcy4NsY4amFeUJMIecVYvKJ+RN2P0m4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kuka_agilus_support";
  version = "0.9.0-2";
  src = sources.kuka_agilus_support;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher_gui kuka_resources launch_ros robot_state_publisher rviz2 urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
