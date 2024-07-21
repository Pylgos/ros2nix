{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher_gui,
  launch,
  launch_ros,
  robot_state_publisher,
  rviz2,
  substituteSource,
  urdf,
  xacro,
}:
let
  sources = rec {
    robotiq_description = substituteSource {
      src = fetchgit {
        name = "robotiq_description-source";
        url = "https://github.com/ros2-gbp/ros2_robotiq_gripper-release.git";
        rev = "4131e61c1f07d1e4deeef87ac2f4da3a8e2e6637";
        hash = "sha256-CO6k93lrA+H92beTQuG1tnfMsO99+vpYtYXmfABHcr4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "robotiq_description";
  version = "0.0.1-3";
  src = sources.robotiq_description;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher_gui launch_ros robot_state_publisher rviz2 urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}