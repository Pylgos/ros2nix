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
    kuka_cybertech_support = substituteSource {
      src = fetchgit {
        name = "kuka_cybertech_support-source";
        url = "https://github.com/ros2-gbp/kuka_robot_descriptions-release.git";
        rev = "ec82015f08acbece269f189d42b2a3f08a6337f0";
        hash = "sha256-dUyuouXgw5RKQBEP4557jqJx/LQvPsrzmb2cgdnOdFs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kuka_cybertech_support";
  version = "0.9.0-2";
  src = sources.kuka_cybertech_support;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher_gui kuka_resources launch_ros robot_state_publisher rviz2 urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
